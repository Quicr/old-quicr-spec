This specification outlines the design for a real time datagram transport protocol. It is based on a
pub/sub metaphor where clients endpoints publish and subscribe to data that is sent to, and received
from, relays in the cloud. The information subscribed to is named such that this forms an overlay
information centric network. It is optimized for real time data such as audio video conferencing
system or games. The transport provides for reliably and unreliably transport of named object and
runs on top of UDP with latency limits.
