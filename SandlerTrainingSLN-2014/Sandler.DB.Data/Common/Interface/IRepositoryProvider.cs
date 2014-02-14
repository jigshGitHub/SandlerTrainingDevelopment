﻿using Sandler.DB.Data.Repositories.Interfaces;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Sandler.DB.Data.Common.Interface
{
    public interface IRepositoryProvider
    {
        /// <summary>
        /// Get and set the <see cref="IDBContext"/> with which to initialize a repository
        /// if one must be created.
        /// </summary>
        IDBContext dbContext { get; set; }

        /// <summary>
        /// Get an <see cref="IRepository{T}"/> for entity type, T.
        /// </summary>
        /// <typeparam name="T">
        /// Root entity type of the <see cref="IRepository{T}"/>.
        /// </typeparam>
        IRepository<T> GetRepositoryForEntityType<T>() where T : class;

        /// <summary>
        /// Get a repository of type T.
        /// </summary>
        /// <typeparam name="T">
        /// Type of the repository, typically a custom repository interface.
        /// </typeparam>
        /// <param name="factory">
        /// An optional repository creation function that takes a <see cref="IDBContext"/>
        /// and returns a repository of T. Used if the repository must be created.
        /// </param>
        /// <remarks>
        /// Looks for the requested repository in its cache, returning if found.
        /// If not found, tries to make one with the factory, fallingback to 
        /// a default factory if the factory parameter is null.
        /// </remarks>
        T GetRepository<T>(Func<IDBContext, object> factory = null) where T : class;


        /// <summary>
        /// Set the repository to return from this provider.
        /// </summary>
        /// <remarks>
        /// Set a repository if you don't want this provider to create one.
        /// Useful in testing and when developing without a backend
        /// implementation of the object returned by a repository of type T.
        /// </remarks>
        void SetRepository<T>(T repository);
    }
}
