//[assembly: WebActivator.PreApplicationStartMethod(typeof(Sandler.Web.App_Start.NinjectWebCommon), "Start")]
//[assembly: WebActivator.ApplicationShutdownMethodAttribute(typeof(Sandler.Web.App_Start.NinjectWebCommon), "Stop")]

//namespace Sandler.Web.App_Start
//{
//    using System;
//    using System.Web;

//    using Microsoft.Web.Infrastructure.DynamicModuleHelper;

//    using Ninject;
//    using Ninject.Web.Common;
//    using System.Web.Http;
//    using Sandler.DB.Data.Repositories;
//    using Sandler.DB.Data.Common.Interface;
//    using Sandler.DB.Data.Common;
//    using Sandler.DB.Data.Common.Implementation;
//    using Sandler.DB.Data.Repositories.Interfaces;
//    using Sandler.DB.Data.Repositories.Implementations;
//    using WebApiContrib.IoC.Ninject;

//    public static class NinjectWebCommon
//    {
//        private static readonly Bootstrapper bootstrapper = new Bootstrapper();

//        /// <summary>
//        /// Starts the application
//        /// </summary>
//        public static void Start()
//        {
//            DynamicModuleUtility.RegisterModule(typeof(OnePerRequestHttpModule));
//            DynamicModuleUtility.RegisterModule(typeof(NinjectHttpModule));
//            bootstrapper.Initialize(CreateKernel);
//        }

//        /// <summary>
//        /// Stops the application.
//        /// </summary>
//        public static void Stop()
//        {
//            bootstrapper.ShutDown();
//        }

//        /// <summary>
//        /// Creates the kernel that will manage your application.
//        /// </summary>
//        /// <returns>The created kernel.</returns>
//        private static IKernel CreateKernel()
//        {
//            var kernel = new StandardKernel();
//            kernel.Bind<Func<IKernel>>().ToMethod(ctx => () => new Bootstrapper().Kernel);
//            kernel.Bind<IHttpModule>().To<HttpApplicationInitializationHttpModule>();

//            //Support for WebAPI
//            GlobalConfiguration.Configuration.DependencyResolver = new NinjectResolver(bootstrapper.Kernel);

//            RegisterServices(kernel);
//            return kernel;
//        }

//        /// <summary>
//        /// Load your modules or register your services here!
//        /// </summary>
//        /// <param name="kernel">The kernel.</param>
//        private static void RegisterServices(IKernel kernel)
//        {
//            kernel.Bind<RepositoryFactories>().To<RepositoryFactories>().InSingletonScope();
//            kernel.Bind<IRepositoryProvider>().To<SandlerRepositoryProvider>();
//            kernel.Bind<ICompanyRepository>().To<VWCompanyRepository>();
//            kernel.Bind<IDBContext>().To<SandlerDBContext>();
//            kernel.Bind<IUnitOfWork>().To<SandlerUnitOfWork>();
//        }
//    }
//}
