from gi.repository import Gio, GLib
import sys

class BLUET:

    def __init__(self):
        self.bus_type = Gio.BusType.SYSTEM
        self.bus_name = 'org.bluez'
        self.object_path = '/org/bluez/hci0'
        self.mngr_obj_path = '/'
        self.mngr_iface = 'org.freedesktop.DBus.ObjectManager'
        self.adapter_iface = 'org.bluez.Adapter1'
        self.props_iface = 'org.freedesktop.DBus.Properties'
    
    def new_proxy(self, obj_path, iface):
        return Gio.DBusProxy.new_for_bus_sync(
            bus_type=self.bus_type,
            flags=Gio.DBusProxyFlags.NONE,
            info=None,
            name=self.bus_name,
            object_path=obj_path,
            interface_name=iface,
            cancellable=None)

    def gen_proxies(self):
        self.mngr_proxy = self.new_proxy(self.mngr_obj_path, self.mngr_iface)
        self.adapter_proxy = self.new_proxy(self.object_path, self.adapter_iface)
        self.props_proxy = self.new_proxy(self.object_path, self.props_iface)

    def check_power(self):
        self.powered = self.props_proxy.Get('(ss)', self.adapter_iface, 'Powered')
        return self.powered

    def toggle_power(self):
        if self.powered:
            self.props_proxy.Set('(ssv)',
                        self.adapter_iface,
                        'Powered',
                        GLib.Variant.new_boolean(False)
                        )
        else:
            self.props_proxy.Set('(ssv)',
                        self.adapter_iface,
                        'Powered',
                        GLib.Variant.new_boolean(True)
                        )

        return self.check_power()

    def check_scan(self):
        self.scan_on = self.props_proxy.Get('(ss)', self.adapter_iface, 'Discovering')
        return self.scan_on

    def toggle_scan(self):
        if self.scan_on:
            self.adapter_proxy.StopDiscovery()
        else:
            self.adapter_proxy.StartDiscovery()

        return self.check_scan




bt = BLUET()
bt.gen_proxies()
print(bt.check_scan())
bt.toggle_scan()
print(bt.check_scan())
bt.toggle_scan()
print(bt.check_scan())
