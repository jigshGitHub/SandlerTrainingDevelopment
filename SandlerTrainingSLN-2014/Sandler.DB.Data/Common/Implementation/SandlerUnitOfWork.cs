﻿using Sandler.DB.Data.Common.Interface;
using Sandler.DB.Data.Repositories.Implementations;
using Sandler.DB.Data.Repositories.Interfaces;
using Sandler.DB.Models;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Sandler.DB.Data.Common.Implementation
{
    public class SandlerUnitOfWork : IUnitOfWork
    {
        public SandlerUnitOfWork(IRepositoryProvider repositoryProvider, IDBContext dbContext)
        {
            repositoryProvider.dbContext = dbContext;
            RepositoryProvider = repositoryProvider;
        }

        // Repositories
        public ICompanyRepository CompanyRepository() { return new CompanyRepository(RepositoryProvider.dbContext); }
        public IAceMainRepository AceMainRepository() { return new AceMainRepository(RepositoryProvider.dbContext); }
        public IMyPGRepository MyPGRepository() { return new MyPGRepository(RepositoryProvider.dbContext); }
        public IEmailRepository EmailRepository() { return new EmailRepository(RepositoryProvider.dbContext); }
        public IFranchiseeRepository FranchiseeRepository() { return new FranchiseeRepository(RepositoryProvider.dbContext); }
        public IFranchiseeUsersRepository FranchiseeUsersRepository() { return new FranchiseeUsersRepository(RepositoryProvider.dbContext); }
        public IKendoChartsRepository KendoChartsRepository() { return new KendoChartsRepository(RepositoryProvider.dbContext); }
        public IMyTaskRepository MyTaskRepository() { return new MyTaskRepository(RepositoryProvider.dbContext); }
        public IContactRepository ContactRepository() { return new ContactRepository(RepositoryProvider.dbContext); }
        public IOpportunityRepository OpportunityRepository() { return new OpportunityRepository(RepositoryProvider.dbContext); }
        public IMenuRepository MenuRepository() { return new MenuRepository(RepositoryProvider.dbContext); }
        public IAceEmailTrackerRepository AceEmailTrackerRepository() { return new AceEmailTrackerRepository(RepositoryProvider.dbContext); }
        public IASPNetMembershipRepository MembershipRepository() { return new ASPNetMembershipRepository(RepositoryProvider.dbContext); }
        public IASPNetUsersRepository UserRepository() { return new ASPNetUsersRepository(RepositoryProvider.dbContext); }
        public IRepository<T> Repository<T>() where T : class
        {
            return GetStandardRepo<T>();
        }
        /// <summary>
        /// Save pending changes to the database
        /// </summary>
        public void Save()
        {
            //System.Diagnostics.Debug.WriteLine("Committed");
            RepositoryProvider.dbContext.SaveChanges();
        }

        protected IRepositoryProvider RepositoryProvider { get; set; }

        private IRepository<T> GetStandardRepo<T>() where T : class
        {
            return RepositoryProvider.GetRepositoryForEntityType<T>();
        }
        private T GetRepo<T>() where T : class
        {
            return RepositoryProvider.GetRepository<T>();
        }
        private bool _disposed;

        #region IDisposable

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }


        public virtual void Dispose(bool disposing)
        {
            if (!_disposed)
                if (disposing)
                    RepositoryProvider.dbContext.Get().Dispose();

            _disposed = true;
        }

        #endregion
    }
    //public class UnitOfWork : IUnitOfWork
    //{
    //    private readonly IDBContext dbFactory;

    //    private bool _disposed;
    //    private Hashtable _repositories;

    //    public UnitOfWork(IDBContext context)
    //    {
    //        dbFactory = context;
    //    }


    //    public void Dispose()
    //    {
    //        Dispose(true);
    //        GC.SuppressFinalize(this);
    //    }

    //    public void Save()
    //    {
    //        dbFactory.Get().SaveChanges();
    //    }

    //    public virtual void Dispose(bool disposing)
    //    {
    //        if (!_disposed)
    //            if (disposing)
    //                dbFactory.Get().Dispose();

    //        _disposed = true;
    //    }

    //    public IRepository<T> Repository<T>() where T : class
    //    {
    //        if (_repositories == null)
    //            _repositories = new Hashtable();

    //        var type = typeof(T).Name;

    //        if (!_repositories.ContainsKey(type))
    //        {
    //            var repositoryType = typeof(RepositoryBase<>);
    //            try
    //            {
    //                var repositoryInstance =
    //                    Activator.CreateInstance(repositoryType
    //                            .MakeGenericType(typeof(T)), dbFactory);

    //                _repositories.Add(type, repositoryInstance);
    //            }
    //            catch (Exception ex)
    //            {
    //                throw ex;
    //            }
    //        }

    //        return (IRepository<T>)_repositories[type];
    //    }
    //}
}
