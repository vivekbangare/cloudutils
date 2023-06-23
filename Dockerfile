FROM alpine:3.14
LABEL MAINTAINER "Vivek Bangare <vivek.bangare@gmail.com>"

# Install dependencies
RUN apk --update add curl ca-certificates openssl python3 jq unzip py3-pip bash && \
    rm -rf /var/cache/apk/*

# Set the environment variable
ENV PATH="/google-cloud-sdk/bin:${PATH}"

# Install Google Cloud SDK
RUN curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-436.0.0-linux-x86_64.tar.gz && \
    tar xzf google-cloud-sdk-436.0.0-linux-x86_64.tar.gz && \
    rm google-cloud-sdk-436.0.0-linux-x86_64.tar.gz && \
    google-cloud-sdk/install.sh --quiet && \
    gcloud components install gke-gcloud-auth-plugin kubectl && \
    rm -rf /google-cloud-sdk/.install

# Install awscli
RUN pip3 install --no-cache-dir --upgrade awscli && \
    rm -rf /root/.cache/pip

# Install terraform 1.4
RUN curl -LO "https://releases.hashicorp.com/terraform/1.4.0/terraform_1.4.0_linux_amd64.zip" \
    && unzip terraform_1.4.0_linux_amd64.zip \
    && chmod +x terraform \
    && mv terraform /usr/local/bin/ \
    && rm terraform_1.4.0_linux_amd64.zip

# Set the entry point to /bin/bash or any other desired command
ENTRYPOINT ["/bin/bash"]
