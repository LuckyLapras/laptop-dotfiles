from gi.repository import Gio, GLib
import sys

fd = sys.stdout

col_off = '#696969'
col_on = '#f7a8b8'
col_con = '#86dcfc'

bus_type = Gio.BusType.SYSTEM
bus_name = 'org.bluez'
object_path = '/org/bluez/hci0'
object_path2 = '/'
mngr_iface = 'org.freedesktop.DBus.ObjectManager'
adapter_iface = 'org.bluez.Adapter1'

def render(powered, connected):
    sym = ' '
    if powered is True and connected is True:
        col_line = col_con
        text = 'Connected'
    elif powered is True and connected is False:
        col_line = col_on
        text = 'Powered'
    else:
        sym = ' '
        col_line = col_off
        text = 'Unpowered'
    fd.write('%{+u}%{U' + col_line + '}%{F#ec3257}' + sym + '%{F-}' + text + '%{U-}%{-u}\n')
    fd.flush()

def init():
    #props_proxy = Gio.DBusProxy.new_for_bus_sync(
    #        bus_type=bus_type,
    #        flags=Gio.DBusProxyFlags.NONE,
    #        info=None,
    #        name=bus_name,
    #        object_path=object_path,
    #        interface_name='org.freedesktop.DBus.Properties',
    #        cancellable=None)
    #powered = props_proxy.Get('(ss)', adapter_iface, 'Powered')
    render(False, False)

def props_handler(proxy: Gio.DBusProxy,
                  changed_props: GLib.Variant,
                  invalidated_props: list) -> None:
    props = changed_props.unpack()
    powered = props.get('Powered')
    powered = False if powered is None else powered
    connected = props.get('Connected')
    connected = False if connected is None else connected
    render(powered, connected)

mngr_proxy = Gio.DBusProxy.new_for_bus_sync(
        bus_type=bus_type,
        flags=Gio.DBusProxyFlags.NONE,
        info=None,
        name=bus_name,
        object_path=object_path2,
        interface_name=mngr_iface,
        cancellable=None)

mngd_objs = mngr_proxy.GetManagedObjects()

dev_proxy = [0] * len(mngd_objs.items())
i = 0
for obj_path, obj_data in mngd_objs.items():
    dev_proxy[i] = Gio.DBusProxy.new_for_bus_sync(
            bus_type=bus_type,
            flags=Gio.DBusProxyFlags.NONE,
            info=None,
            name=bus_name,
            object_path=obj_path,
            interface_name='org.bluez.Device1',
            cancellable=None)

    dev_proxy[i].connect('g-properties-changed', props_handler)
    i = i+1

adapter_proxy = Gio.DBusProxy.new_for_bus_sync(
        bus_type=bus_type,
        flags=Gio.DBusProxyFlags.NONE,
        info=None,
        name=bus_name,
        object_path=object_path,
        interface_name=adapter_iface,
        cancellable=None)

adapter_proxy.connect('g-properties-changed', props_handler)

mainloop = GLib.MainLoop()

try:
    init()
    mainloop.run()
except KeyboardInterrupt:
    mainloop.quit()
