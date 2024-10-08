﻿using LCDE.Models;
using LCDE.Models.Enums;
using MailKit.Net.Smtp;
using MailKit.Security;
using MimeKit;

namespace LCDE.Servicios
{
    public interface IEmailService
    {
        Task SendEmailAsync(string email, string subject, string message, List<IFormFile>? attachments = null);
    }

    public class EmailService : IEmailService
    {
        private readonly ILogService logService;
        private readonly IConfiguration configuration;

        public EmailService(
            ILogService logService,
            IConfiguration configuration)
        {
            this.logService = logService;
            this.configuration = configuration;
        }

        public async Task SendEmailAsync(string email, string subject, string message, List<IFormFile>? attachments = null)
        {
            try
            {
                var newEmail = new MimeMessage();
                newEmail.From.Add(MailboxAddress.Parse("eshoes-clangpt"));
                newEmail.To.Add(MailboxAddress.Parse(email));
                newEmail.Subject = subject;

                var bodyBuilder = new BodyBuilder
                {
                    HtmlBody = message
                };

                // Agregar archivos adjuntos si existen
                if (attachments != null && attachments.Any())
                {
                    foreach (var attachment in attachments)
                    {
                        using var stream = new MemoryStream();
                        await attachment.CopyToAsync(stream);
                        stream.Position = 0;
                        bodyBuilder.Attachments.Add(attachment.FileName, stream.ToArray(), ContentType.Parse(attachment.ContentType));
                    }
                }

                newEmail.Body = bodyBuilder.ToMessageBody();

                using var smtp = new SmtpClient();

                // Ignorar la validación del certificado en entornos de desarrollo
                smtp.ServerCertificateValidationCallback = (sender, certificate, chain, sslPolicyErrors) => true;

                smtp.Connect(
                    configuration["SMTP:HOST"],
                    configuration.GetSection("SMTP").GetValue<int>("PORT"),
                    SecureSocketOptions.StartTls
                );

                smtp.Authenticate(
                    configuration["SMTP:USERNAME"],
                    configuration["SMTP:PASSWORD"].Replace('*', ' ') // Reemplazar asteriscos por espacios
                );

                var result = await smtp.SendAsync(newEmail);
                smtp.Disconnect(true);

                LogEnum logLevel = LogEnum.INFO;
                string logType = logLevel.GetDisplayName() ?? "None";
                var logResult = new Log
                {
                    Type = logType,
                    Message = $"Email sent to {email} with subject {subject}, Result: {result}",
                    StackTrace = "",
                    Date = DateTime.Now
                };
                logService.Log(logResult);
            }
            catch (Exception ex)
            {
                LogError(ex);
                throw;
            }
        }

        private void LogError(Exception ex)
        {
            try
            {
                var logError = new Log
                {
                    Type = LogEnum.ERROR.GetDisplayName() ?? "None",
                    Message = ex.Message,
                    StackTrace = ex.StackTrace ?? "",
                    Date = DateTime.Now
                };
                logService.Log(logError);
            }
            catch
            {
                throw;
            }
        }
    }
}