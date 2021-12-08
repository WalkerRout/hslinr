# Haskell Linear Regression
Linear regression implemented **from scratch** in Haskell using gradient descent

### The following equations were derived from the Mean Squared Error (MSE) function
> Partial derivates are used to find the gradients of the slope (m) and the y-intercept (b) (more info on how they were derived to be included later, but it was fairly basic in terms of difficulty)

![Equations for partial derivatives of Mean Squared Error function](https://user-images.githubusercontent.com/89273280/145147648-98dcb383-c70e-4a6b-bb6c-0376331c3341.png)

All of the iterative functions in this script are tail recursive; the program runs extremely fast an efficiently, and its functions can be easily abstracted and exported.
