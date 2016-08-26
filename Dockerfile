FROM golang:1.6

# Install beego and the bee dev tool
RUN go get github.com/astaxie/beego && go get github.com/beego/bee

# Create the directory where the application will reside
RUN mkdir /app

# Copy the application files (needed for production)
ADD MathApp/views /app/views
ADD MathApp /app/MathApp
ADD MathApp/conf /app/conf

# Set the working directory to the app directory
WORKDIR /app

# Expose the application on port 8080.
# This should be the same as in the app.conf file
EXPOSE 8080

RUN chmod +x /app/MathApp

# Set the entry point of the container to the application executable
ENTRYPOINT /app/MathApp

CMD ["bee", "run"]
