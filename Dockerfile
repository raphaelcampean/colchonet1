# Start from the official Ruby image

FROM ruby:3.0.2

# Install dependencies for Rails asset compilation and database

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Install Yarn

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -

RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update -qq && apt-get install -y yarn

# Set the working directory

WORKDIR /colchonet

# Add the Gemfile and Gemfile.lock to the image

COPY Gemfile /colchonet/Gemfile

COPY Gemfile.lock /colchonet/Gemfile.lock

# Install gems

RUN bundle install

# Copy the rest of the application into the image

COPY . /colchonet

# Expose the port that the Rails server will run on

EXPOSE 3000

# Define the command to start the server

CMD ["rails", "server", "-b", "0.0.0.0"]
