**Modified to customize the demo. This project is originally developed by Google to demonstrate use of technologies like
Kubernetes/GKE, Istio, Stackdriver, gRPC and OpenCensus**.

# Book Store: Cloud-Native Microservices Demo Application

This project contains a 10-tier microservices application. The application is a
web-based e-commerce app called **“Book Store”** where users can browse whitepapers, eBooks
add them to the cart, and purchase them.

This application works on any Kubernetes cluster (including a local one. It’s **easy to deploy with little to no configuration**.

## Screenshots

| Home Page                                                                                                         | Checkout Screen                                                                                                    |
| ----------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------ |
| [![Screenshot of store homepage](./docs/img/book-store-frontend-1.png)](./docs/img/book-store-frontend-1.png) | [![Screenshot of checkout screen](./docs/img/book-store-frontend-2.png)](./docs/img/book-store-frontend-2.png) |

## Service Architecture
G
**Book Store** (originally Hipster Shop) is composed of many microservices written in different
languages that talk to each other over gRPC.

[![Architecture of
microservices](./docs/img/architecture-diagram.png)](./docs/img/architecture-diagram.png)


| Service                                              | Language      | Description                                                                                                                       |
| ---------------------------------------------------- | ------------- | --------------------------------------------------------------------------------------------------------------------------------- |
| [frontend](./src/frontend)                           | Go            | Exposes an HTTP server to serve the website. Does not require signup/login and generates session IDs for all users automatically. |
| [cartservice](./src/cartservice)                     | C#            | Stores the items in the user's shopping cart in Redis and retrieves it.                                                           |
| [productcatalogservice](./src/productcatalogservice) | Go            | Provides the list of products from a JSON file and ability to search products and get individual products.                        |
| [currencyservice](./src/currencyservice)             | Node.js       | Converts one money amount to another currency. Uses real values fetched from European Central Bank. It's the highest QPS service. |
| [paymentservice](./src/paymentservice)               | Node.js       | Charges the given credit card info (mock) with the given amount and returns a transaction ID.                                     |
| [shippingservice](./src/shippingservice)             | Go            | Gives shipping cost estimates based on the shopping cart. Ships items to the given address (mock)                                 |
| [emailservice](./src/emailservice)                   | Python        | Sends users an order confirmation email (mock).                                                                                   |
| [checkoutservice](./src/checkoutservice)             | Go            | Retrieves user cart, prepares order and orchestrates the payment, shipping and the email notification.                            |
| [recommendationservice](./src/recommendationservice) | Python        | Recommends other products based on what's given in the cart.                                                                      |
| [adservice](./src/adservice)                         | Java          | Provides text ads based on given context words.                                                                                   |
| [loadgenerator](./src/loadgenerator)                 | Python/Locust | Continuously sends requests imitating realistic user shopping flows to the frontend.                                              |

## Features

- **[Feature List ](https://github.com/GoogleCloudPlatform/microservices-demo#features):**
  
## Installation

To install the bookstore app run the following steps
1. **Minikube** (~20 minutes) You will deploy the microservices image to a single-node
   Kubernetes cluster running on your development machine. 
   - Create a new minikube by running `minikube start --cpus=4 --memory 4096` You can use your existing minikube as well. 
   - Setup bookstore by running `kubectl apply -f https://raw.githubusercontent.com/sitaramkm/microservices-demo/master/release/kubernetes-manifests.yaml`
   - Get your minikube ip by running `minikube ip`
   - Find the NodePort of the frontend-external svc and access the BookStore as `http://<minikubeip>:<frontend-external-svc-nodeport>`

2. **Kind** (~20 minutes) You will deploy the microservices image into a single-node 
   Kubernetes cluster running on Docker in your development machine.
   - Download Docker for Desktop and make sure Kubernetes is enabled
   - Setup bookstore by running `kubectl apply -f https://raw.githubusercontent.com/sitaramkm/microservices-demo/master/release/kubernetes-manifests.yaml`
   - Access the BookStore on your Docker for Desktop using `http://localhost`

3. **Cloud** (~15 minutes) Deploy the microservices into your cloud managed Kubernetes
   cluster. 
   - Setup bookstore by running `kubectl apply -f https://raw.githubusercontent.com/sitaramkm/microservices-demo/master/release/kubernetes-manifests.yaml`
   - Find the external ip (this will be the loadbalancer) for frontend-external service.  
   - Access the BookStore as `http://<external-load-balancer-url>` 


## Setting up NGINX Ingress 

## Certificate Management with Venafi

## Install and Configure Istio

## Working with Istio tools


To build source code from scratch and deploy:

- **[Build and Install ](https://github.com/GoogleCloudPlatform/microservices-demo#installation):**

### Cleanup

1. Delete Istio 
2. Delete Venafi
3. Delete NGINX Ingress
4. Delete demo application

If you've deployed the application with `kubectl apply -f [...]`, you can
run `kubectl delete -f [...]` with the same argument to clean up the deployed
resources.

---

This readme is derived from Google's microservices demo and is not an official project. The objective of this project is hands-on learning. 
