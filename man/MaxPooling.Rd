% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/layers.pooling.R
\name{MaxPooling}
\alias{MaxPooling}
\alias{MaxPooling1D}
\alias{MaxPooling2D}
\alias{MaxPooling3D}
\title{Max pooling operations}
\usage{
MaxPooling1D(pool_size = 2, strides = NULL, padding = "valid",
  input_shape = NULL)

MaxPooling2D(pool_size = c(2, 2), strides = NULL, padding = "valid",
  data_format = NULL, input_shape = NULL)

MaxPooling3D(pool_size = c(2, 2, 2), strides = NULL, padding = "valid",
  data_format = NULL, input_shape = NULL)
}
\arguments{
\item{pool_size}{Integer or triplet of integers; size(s)
of the max pooling windows.}

\item{strides}{Integer, triplet of integers, or None.
Factor(s) by which to downscale.
E.g. 2 will halve the input. If NULL, it
will default to pool_size.}

\item{padding}{One of "valid" or "same" (case-insensitive).}

\item{input_shape}{only need when first layer of a model;
sets the input shape of the data}

\item{data_format}{A string, one of channels_last (default) or
channels_first}
}
\description{
Max pooling operations
}
\examples{
if(keras_available()) {
  X_train <- array(rnorm(100 * 28 * 28), dim = c(100, 28, 28, 1))
  Y_train <- to_categorical(matrix(sample(0:2, 100, TRUE), ncol = 1), 3)
  
  mod <- Sequential()
  mod$add(Conv2D(filters = 2, kernel_size = c(2, 2),
                 input_shape = c(28, 28, 1)))
  mod$add(Activation("relu"))
  mod$add(MaxPooling2D(pool_size=c(2, 2)))
  mod$add(LocallyConnected2D(filters = 2, kernel_size = c(2, 2)))
  mod$add(Activation("relu"))
  mod$add(MaxPooling2D(pool_size=c(2, 2)))
  mod$add(Dropout(0.25))
  
  mod$add(Flatten())
  mod$add(Dropout(0.5))
  mod$add(Dense(3, activation='softmax'))
  
  keras_compile(mod, loss='categorical_crossentropy', optimizer=RMSprop())
  keras_fit(mod, X_train, Y_train, verbose = 0)
}
}
\references{
Chollet, Francois. 2015. \href{https://keras.io/}{Keras: Deep Learning library for Theano and TensorFlow}.
}
\seealso{
Other layers: \code{\link{Activation}},
  \code{\link{ActivityRegularization}},
  \code{\link{AdvancedActivation}},
  \code{\link{BatchNormalization}}, \code{\link{Conv}},
  \code{\link{Dense}}, \code{\link{Dropout}},
  \code{\link{Embedding}}, \code{\link{Flatten}},
  \code{\link{GaussianNoise}}, \code{\link{LayerWrapper}},
  \code{\link{LocallyConnected}}, \code{\link{Masking}},
  \code{\link{Permute}}, \code{\link{RNN}},
  \code{\link{RepeatVector}}, \code{\link{Reshape}},
  \code{\link{Sequential}}
}
\author{
Taylor B. Arnold, \email{taylor.arnold@acm.org}
}
