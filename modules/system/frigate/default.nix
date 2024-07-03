{ pkgs, config, ... }:

{
  virtualisation.oci-containers = {
    backend = "docker";
    containers = {
      "frigate" = {
        image = "ghcr.io/blakeblackshear/frigate:stable";
        autoStart = true;
        environment = {
          FRIGATE_RTSP_PASSWORD = "password";
        };
        volumes = [
          "/etc/localtime:/etc/localtime:ro"
          "/opt/frigate/config:/config"
          "/opt/frigate/storage:/media/frigate"
        ];
        ports = [
          "5000:5000"
          "8554:8554" # RTSP feeds
          "8555:8555/tcp" # WebRTC over tcp
          "8555:8555/udp" # WebRTC over udp
        ];
        extraOptions = [
          "--device=/dev/bus/usb:/dev/bus/usb" # Coral
          "--device=/dev/dri/renderD128:/dev/dri/renderD128" # Intel GPU
          "--privileged"
          "--shm-size=128m"
          "--tmpfs=/tmp/cache,size=1000000000"
        ];
      };
    };
  };
}
