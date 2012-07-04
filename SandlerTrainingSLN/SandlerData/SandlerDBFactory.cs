using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Linq.Expressions;
using System.Data;
using System.Data.Entity;
using SandlerModels;
namespace SandlerData
{
    public class Disposable : IDisposable
    {
        private bool isDisposed;

        ~Disposable()
        {
            Dispose(false);
        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }
        private void Dispose(bool disposing)
        {
            if (!isDisposed && disposing)
            {
                DisposeCore();
            }

            isDisposed = true;
        }

        protected virtual void DisposeCore()
        {
        }
    }
    
    public interface IDatabaseFactory : IDisposable
    {
        DbContext Get();
    }

    public class SandlerDBFactory : IDatabaseFactory
    {
        private SandlerDBEntities dbContext;

        public System.Data.Entity.DbContext Get()
        {
            return dbContext ?? (dbContext = new SandlerDBEntities());
        }

        public void Dispose()
        {
            throw new System.NotImplementedException();
        }
    }
}
