bind_addr =  "{{ bind_addr }}"

data_dir = "{{ data_dir }}"

datacenter = "{{ datacenter }}"

{% if is_server %}
  server {
    enabled = true
    bootstrap_expect = {{ cluster.servers | length | int }}
  }
{% else %}
  client {
    enabled = true
    servers = {{ cluster.servers | to_nice_json }}
    network_interface = "{{ network_interface }}"
  }
{% endif %}

consul {
  address = "{{ bind_addr }}:8500"
}
