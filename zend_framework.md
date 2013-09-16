The Front Controller
====================

`Zend_Controller_Front` is the unique entry point to our application. It serves
as a registry to the _router_, _dispatcher_, and _action controllers_ trough
parameters:
```php
$front->setParam('noErrorHandler', true);
$front->setParam('noViewRenderer', true);
```
Different useful methods:
-------------------------
```php
$front->setControllerDirectory(''); // used by the Dispatcher
$front->throwExceptions(true);      // instead of storing them into the Response
$front->returnResponse(true);       // check the stored exceptions
```
```php
$front->getRouter();
```
`Zend_Controller_Front` triggers different dispatch events which could be
observed by plugins. Thus, we don't need to extend the front controller to add
functionality.

The Zend_Controller basics
==========================

* **Zend_Router_Rewrite**
Writes controller/action/parameter into `Zend_Controller_Request_Http` with its' own methods:
```php
$request->setControllerName('');
$request->setActionName('');
```
* **Zend_Controller_Dispatcher_Standard**
Pulls controller/action/parameter from `Zend_Controller_Request_Http` with its' own methods:
```php
$request->getControllerName('');
$request->getActionName('');
$request->getUserParam('');
```
* **Zend_Controller_Dispatcher_Standard**
Loop `while !$request->isDispatched()`:
- Controller instantiated
- Action called

The workflow of `Zend_Controller` is relatively simple. A request is received by
`Zend_Controller_Front`, which in turn calls `Zend_Controller_Router_Rewrite` to
determine which controller (and action in that controller) to dispatch.
`Zend_Controller_Router_Rewrite` decomposes the URI in order to set the
controller and action names in the request. `Zend_Controller_Front` then enters
a dispatch loop. It calls `Zend_Controller_Dispatcher_Standard`, passing it the
request, to dispatch to the controller and action specified in the request (or
use defaults). After the controller has finished, control returns to
`Zend_Controller_Front`. If the controller has indicated that another controller
should be dispatched by resetting the dispatched status of the request, the loop
continues and another dispatch is performed. Otherwise, the process ends.

Routing
=======

*Note*: *Reverse Matching*
Routes are matched in reverse order so make sure your most generic routes are defined first.

1. **Variable route**
```php
$route = new Zend_Controller_Router_Route(
    'archive/:year',
    array(
        'year'       => 2006,      // variable defaults (:year is our var part)
        'controller' => 'archive',
        'action'     => 'show'
    ),
    array('year' => '\d+')         // variable requirements
);
$router->addRoute('archive', $route);
```
2. **Static route**
```php
$route = new Zend_Controller_Router_Route_Static(
    'login',
    array('controller' => 'auth', 'action' => 'login')
);
$router->addRoute('login', $route);
```
3. **Regex route**
```php
$route = new Zend_Controller_Router_Route_Regex(
    'archive(?:/(\d+))?',
    array(
        1            => '2006',
        'controller' => 'archive',
        'action'     => 'show'
    )
    array(
        // Zend_Controller_Action::_getParam('year'); or
        // Zend_Controller_Request::getParam('year');
        1 => 'year' // or 'year' => 1
    )
);
$router->addRoute('archive', $route);
```
Dispatching
===========

```php
public function bazAction()
{
    // forward to an action in another controller in another module,
    // Foo_BarController::bazAction():
    $this->_forward(
        'baz',                  // action
        'bar',                  // controller
        'foo',                  // module
        array('baz' => 'bogus') // params
    );
}
```
Useful links
============

http://framework.zend.com/manual/en/zend.controller.html
