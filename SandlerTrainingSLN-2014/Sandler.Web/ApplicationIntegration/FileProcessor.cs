using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Runtime.Serialization;
using System.Net.Http;
using System.Web.Hosting;
using System.IO;
namespace Sandler.Web.ApplicationIntegration
{
    interface IFileProcessor
    {
        Guid SaveUploadedFile(HttpPostedFileBase fileBase);
        Guid SaveUploadedFileWithIdentifier(HttpPostedFileBase fileBase, string additionalIdentifier);
        string GetFilePath(string fileName);
    }
    internal class FileProcessor : IFileProcessor
    {
        private string _uploadsFolder = System.Configuration.ConfigurationManager.AppSettings["uploadDocumentsDirectory"];

        public Guid SaveUploadedFile(HttpPostedFileBase fileBase)
        {
            var identifier = Guid.NewGuid();
            //fileBase.SaveAs(GetDiskLocation(identifier));
            fileBase.SaveAs(GetDiskLocation(identifier.ToString() + "_" + fileBase.FileName));
            return identifier;
        }

        public Guid SaveUploadedFileWithIdentifier(HttpPostedFileBase fileBase, string additionalIdentifier)
        {
            var identifier = Guid.NewGuid();
            //fileBase.SaveAs(GetDiskLocation(identifier));
            fileBase.SaveAs(GetDiskLocation(additionalIdentifier + "_" + fileBase.FileName));
            return identifier;
        }


        private string GetDiskLocation(Guid identifier)
        {
            return Path.Combine(_uploadsFolder, identifier.ToString());
        }

        private string GetDiskLocation(string fileName)
        {
            return Path.Combine(_uploadsFolder, fileName);
        }

        public string  GetFilePath(string fileName)
        {
            return GetDiskLocation(fileName);
        }
    }
    public class CustomMultipartFormDataStreamProvider : MultipartFormDataStreamProvider
    {
        public CustomMultipartFormDataStreamProvider(string path)
            : base(path)
        {
        }

        public override string GetLocalFileName(System.Net.Http.Headers.HttpContentHeaders headers)
        {
            var name = !string.IsNullOrWhiteSpace(headers.ContentDisposition.FileName) ? headers.ContentDisposition.FileName : "NoName";
            return name.Replace("\"", string.Empty);
        }
    }
    [DataContract]
    public class FileDesc
    {
        [DataMember]
        public string name { get; set; }

        [DataMember]
        public string path { get; set; }

        [DataMember]
        public long size { get; set; }

        public FileDesc(string n, string p, long s)
        {
            name = n;
            path = p;
            size = s;
        }
    }
}