using Sandler.DB.Data.Common.Interface;
using Sandler.DB.Data.Repositories.Implementations;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Sandler.DB.Data.Repositories
{
    public class RepositoryFactories
    {

        /// <summary>
        /// Constructor that initializes with runtime custom repository factories
        /// </summary>
        public RepositoryFactories()
        {
            _repositoryFactories = GetCustomFactories();
        }

        /// <summary>
        /// Constructor that initializes with an arbitrary collection of factories
        /// </summary>
        /// <param name="factories">
        /// The repository factory functions for this instance. 
        /// </param>
        /// <remarks>
        /// This ctor is primarily useful for testing this class
        /// </remarks>
        public RepositoryFactories(IDictionary<Type, Func<IDBContext, object>> factories)
        {
            _repositoryFactories = factories;
        }

        /// <summary>
        /// Get the repository factory function for the type.
        /// </summary>
        /// <typeparam name="T">Type serving as the repository factory lookup key.</typeparam>
        /// <returns>The repository function if found, else null.</returns>
        /// <remarks>
        /// The type parameter, T, is typically the repository type 
        /// but could be any type (e.g., an entity type)
        /// </remarks>
        public Func<IDBContext, object> GetRepositoryFactory<T>()
        {

            Func<IDBContext, object> factory;
            _repositoryFactories.TryGetValue(typeof(T), out factory);
            return factory;
        }

        /// <summary>
        /// Get the factory for <see cref="IRepository{T}"/> where T is an entity type.
        /// </summary>
        /// <typeparam name="T">The root type of the repository, typically an entity type.</typeparam>
        /// <returns>
        /// A factory that creates the <see cref="IRepository{T}"/>, given an EF <see cref="IDBContext"/>.
        /// </returns>
        /// <remarks>
        /// Looks first for a custom factory in <see cref="_repositoryFactories"/>.
        /// If not, falls back to the <see cref="DefaultEntityRepositoryFactory{T}"/>.
        /// You can substitute an alternative factory for the default one by adding
        /// a repository factory for type "T" to <see cref="_repositoryFactories"/>.
        /// </remarks>
        public Func<IDBContext, object> GetRepositoryFactoryForEntityType<T>() where T : class
        {
            return GetRepositoryFactory<T>() ?? DefaultEntityRepositoryFactory<T>();
        }

        /// <summary>
        /// Default factory for a <see cref="IRepository{T}"/> where T is an entity.
        /// </summary>
        /// <typeparam name="T">Type of the repository's root entity</typeparam>
        protected virtual Func<IDBContext, object> DefaultEntityRepositoryFactory<T>() where T : class
        {
            return dbContext => new RepositoryBase<T>(dbContext);
        }

        /// <summary>
        /// Return the runtime repository factory functions,
        /// each one is a factory for a repository of a particular type.
        /// </summary>
        /// <remarks>
        /// MODIFY THIS METHOD TO ADD CUSTOM FACTORY FUNCTIONS
        /// </remarks>
        private IDictionary<Type, Func<IDBContext, object>> GetCustomFactories()
        {
            return new Dictionary<Type, Func<IDBContext, object>>
            {
                //{typeof(IEmployeeRepository), dbContext => new DataFeedRepository(dbContext)},
                //{typeof(ISubscriptionRepository), dbContext => new SubscriptionRepository(dbContext)},
                //{typeof(IPortfolioRepository), dbContext => new PortfolioRepository(dbContext)},
                //{typeof(IPublisherRepository), dbContext => new PublisherRepository(dbContext)},
                //{typeof(ISearchOptionsRepository), dbContext => new SearchOptionsRepository(dbContext)}
            };
        }

        /// <summary>
        /// Get the dictionary of repository factory functions.
        /// </summary>
        /// <remarks>
        /// A dictionary key is a System.Type, typically a repository type.
        /// A value is a repository factory function
        /// that takes a <see cref="IDBContext"/> argument and returns
        /// a repository object. Caller must know how to cast it.
        /// </remarks>
        private readonly IDictionary<Type, Func<IDBContext, object>> _repositoryFactories;

    }
}
