FROM argoproj/argocd:v1.6.2
ARG SOPS_VERSION=v3.6.0

USER root

RUN apt-get update && \
    apt-get install -y \
        curl \
        gpg && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    curl -o /usr/local/bin/sops -L https://github.com/mozilla/sops/releases/download/${SOPS_VERSION}/sops-${SOPS_VERSION}.linux && \
    curl -sL https://aka.ms/InstallAzureCLIDeb | bash && \
    chmod +x /usr/local/bin/sops

USER argocd