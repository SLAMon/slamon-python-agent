FROM python:3.4

# Run as non-root, eventually
RUN groupadd -r slamon && useradd -r -d /workspace -m -g slamon slamon 

# Install dependencies
RUN pip install requests python-dateutil responses

# Install SLAMon Python Agent
ADD . /workspace
WORKDIR /workspace
RUN pip install .
RUN chown -R slamon:slamon /workspace

# Change to a non-root user
USER slamon

CMD ["sh", "-c", "slamon-agent -u ${AFM} -l ${HANDLERS} ${EXTRA_FLAGS}"]
