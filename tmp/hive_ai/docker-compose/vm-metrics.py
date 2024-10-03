from flask import Flask, jsonify
import psutil


app = Flask(__name__)

def bytes_to_mb(size_bytes):
    return round(size_bytes / (1024 * 1024), 2)


@app.route('/metrics/cpu')
def cpu_metrics():
    cpu_percent = psutil.cpu_percent(interval=1)
    cpu_count = psutil.cpu_count()


    cpu_info = {
        'percent': f"{cpu_percent}%",
        'count': cpu_count
    }
    return jsonify(cpu_info)


@app.route('/metrics/memory')
def memory_metrics():
    memory_info = psutil.virtual_memory()
    memory_total = bytes_to_mb(memory_info.total)
    memory_used = bytes_to_mb(memory_info.used)
    memory_free = bytes_to_mb(memory_info.free)


    memory_data = {
        'total_MB': memory_total,
        'used_MB': memory_used,
        'free_MB': memory_free
    }
    return jsonify(memory_data)


@app.route('/metrics/disk')
def disk_metrics():
    disk_usage = psutil.disk_usage('/')
    disk_total = bytes_to_mb(disk_usage.total)
    disk_used = bytes_to_mb(disk_usage.used)
    disk_free = bytes_to_mb(disk_usage.free)


    disk_data = {
        'total_MB': disk_total,
        'used_MB': disk_used,
        'free_MB': disk_free
    }
    return jsonify(disk_data)


@app.route('/metrics/network')
def network_metrics():
    network_info = psutil.net_io_counters()
    system_wide = {
        'bytes_sent_MB': bytes_to_mb(network_info.bytes_sent),
        'bytes_recv_MB': bytes_to_mb(network_info.bytes_recv),
        'packets_sent': network_info.packets_sent,
        'packets_recv': network_info.packets_recv
    }

    net_per_interface = psutil.net_io_counters(pernic=True)
    interface_stats = {}
    for interface, stats in net_per_interface.items():
        interface_stats[interface] = {
            'bytes_sent_MB': bytes_to_mb(stats.bytes_sent),
            'bytes_recv_MB': bytes_to_mb(stats.bytes_recv),
            'packets_sent': stats.packets_sent,
            'packets_recv': stats.packets_recv
        }

    network_data = {
        'system_wide_MB': system_wide,
        'per_interface_MB': interface_stats
    }
    return jsonify(network_data)

@app.route('/metrics')
def all_metrics():
    cpu_percent = psutil.cpu_percent(interval=1)
    cpu_count = psutil.cpu_count()

    memory_info = psutil.virtual_memory()
    memory_total = bytes_to_mb(memory_info.total)
    memory_used = bytes_to_mb(memory_info.used)
    memory_free = bytes_to_mb(memory_info.free)

    disk_usage = psutil.disk_usage('/')
    disk_total = bytes_to_mb(disk_usage.total)
    disk_used = bytes_to_mb(disk_usage.used)
    disk_free = bytes_to_mb(disk_usage.free)

    network_info = psutil.net_io_counters()
    system_wide = {
        'bytes_sent_MB': bytes_to_mb(network_info.bytes_sent),
        'bytes_recv_MB': bytes_to_mb(network_info.bytes_recv),
        'packets_sent': network_info.packets_sent,
        'packets_recv': network_info.packets_recv
    }

    net_per_interface = psutil.net_io_counters(pernic=True)
    interface_stats = {}
    for interface, stats in net_per_interface.items():
        interface_stats[interface] = {
            'bytes_sent_MB': bytes_to_mb(stats.bytes_sent),
            'bytes_recv_MB': bytes_to_mb(stats.bytes_recv),
            'packets_sent': stats.packets_sent,
            'packets_recv': stats.packets_recv
        }

    metrics = {
        'cpu': {
            'percent': f"{cpu_percent}%",
            'count': cpu_count
        },
        'memory': {
            'total_MB': memory_total,
            'used_MB': memory_used,
            'free_MB': memory_free
        },
        'disk': {
            'total_MB': disk_total,
            'used_MB': disk_used,
            'free_MB': disk_free
        },
        'network': {
            'system_wide_MB': system_wide,
            'per_interface_MB': interface_stats
        }
    }

    return jsonify(metrics)


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
