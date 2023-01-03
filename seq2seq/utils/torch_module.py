from torch.distributed.algorithms.join import Joinable
from torch.nn import Module, _EXTRA_STATE_KEY_SUFFIX
from torch.nn.parallel import DistributedDataParallel

class Module(Module):
    def _save_to_state_dict(self, destination, prefix, keep_vars):
        r"""Saves module state to `destination` dictionary, containing a state
        of the module, but not its descendants. This is called on every
        submodule in :meth:`~torch.nn.Module.state_dict`.

        This method has been overridden to prevent models wrapped in a module
        being saved in an unloadable state.

        Args:
            destination (dict): a dict where state will be stored
            prefix (str): the prefix for parameters and buffers used in this
                module
        """
        if prefix == 'module.':
            prefix = ''
        for name, param in self._parameters.items():
            if param is not None:
                destination[prefix + name] = param if keep_vars else param.detach()
        for name, buf in self._buffers.items():
            if buf is not None and name not in self._non_persistent_buffers_set:
                destination[prefix + name] = buf if keep_vars else buf.detach()
        extra_state_key = prefix + _EXTRA_STATE_KEY_SUFFIX
        if getattr(self.__class__, "get_extra_state", Module.get_extra_state) is not Module.get_extra_state:
            destination[extra_state_key] = self.get_extra_state()
            
class DistributedDataParallel(Module, Joinable):
    pass
            
