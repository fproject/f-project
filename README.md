# F-Project Framework for Flex

**F-Project** is a lightweight framework for Flex applications.
The original is a proprietary framework developed by F-Project Team in Hanoi, Vietnam.
The framework is public to opensource from Jan-2015 and still being in refactoring from original proprietary version.
We planned to release first stable version in head of Feb-2015.

**fprj-core** library is the core component set of F-Project.

**fprj-tool** is a tool provides useful featues that helps you in developing Flex projects.

##F-Project Framework features

* **Bootstrapping**: Application bootstrapping.
* **Lightweight IOC Container**: Configuration with AS3 Metadata, MXML, XML files, ActionScript
* **Lightweight Dependency Injection**: DI instantiator, class implementation injection, event listener injection.
* **Strong Typing RESTfull**: A beautiful solution for working with RESTfull services ofwhich data can be deserialized directly to typed object.
* **Advanced Data Binding**: Advanced data binding using AS3 Metadata.
* **Advanced Module & RSLs Manager**: Advanced Module & RSLs management using dependency injection.
* **Active Service**: Implements a common set of operations for supporting remote access to RESTful or AMF service.
* **Active Data Provider**: Provides a collection of model objects, using ActiveService's `find` method to retrieve remote data with automatic pagination.
* **Lightweight MVC Template**: The F-Project MVC template especially designed for Flex AIR project.
* *And much more...*

##F-Project Tools

* **fprj-tool**: This GUI tool is written in Java Swing, and have these following features:
  * FlexUnit Auto Wire: Automatically generate FlexUnit test scripts based on analysing the AS3 source code's methods.
  * Flex Code Analyser: Flex source Line of Code counter, Source code statistics...
  * [Under Development] Flex Code Auto Wire: Automatically generate AS3 model and service classes from server code written in PHP, Java, Scala
* **fproject/pinta**: A fork from [dunamis/pinta](https://github.com/dunamis/pinta) with many new features for testing AMF Server and RESTful Webservices
