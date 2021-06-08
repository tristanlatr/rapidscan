# This currently fails, so we install golismero manually. See issue https://github.com/golismero/golismero/issues/59
# RUN apt-get install -y golismero
# This also fails, so we skip completely for now. See issue https://github.com/kislyuk/argcomplete/issues/348
# RUN cd /opt && git clone https://github.com/golismero/golismero.git && cd golismero && pip install -r requirements.txt && ln -s /opt./golismero/golismero.py /usr/bin/golismero

FROM kalilinux/kali-rolling
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get -yqu dist-upgrade && \
    apt-get -yq install \
      python \
      host \
      whois \
      sslyze \
      wapiti \
      nmap \
      dmitry \
      dnsenum \
      dnsmap \
      dnsrecon \
      dnswalk \
      dirb \
      wafw00f \
      whatweb \
      nikto \
      lbd \
      xsser \
      fierce \
      theharvester \
      davtest \
      uniscan \
      amass \
      wget && \
    apt-get -yq autoremove && \
    apt-get clean && \
    rm -rf /var/lib/{apt,dpkg,cache,log}
RUN cd /usr/local/bin && \
    wget --no-check-certificate -q -O rapidscan.py https://raw.githubusercontent.com/tristanlatr/rapidscan/master/rapidscan.py &&\
    chmod +x rapidscan.py
WORKDIR /app
ENTRYPOINT ["/usr/local/bin/rapidscan.py"]