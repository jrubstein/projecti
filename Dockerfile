FROM node:9.11.1

# Creating temporal directory.
RUN mkdir -p ./tmp/app
WORKDIR /tmp/app

# install yarn.
RUN curl -o- -L https://yarnpkg.com/install.sh | bash
# install dependencies.
RUN yarn

# setting up environment variables
ARG NODE_ENV
ENV NODE_ENV $NODE_ENV
# Copying source code
COPY . /tmp/app

# Expose port
EXPOSE 3000
CMD ["yarn", "start"]
