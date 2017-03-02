DC/OS
=====

See the full `Salt Formulas installation and usage instructions
<http://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_.


Available states
================

.. contents::
    :local:


``dcos``
--------

Installs DC/OS.


``dcos.service``
----------------

Starts DC/OS.


Deploying a cluster
===================

Choose some masters and agents for your DC/OS cluster. Say you want to configure masters ``'my-dcos-master-1'``,
``'my-dcos-master-2'``, and so on. Say you also want to configure agents ``'my-dcos-agent-1'``,
``'my-dcos-agent-2'``, and so on.

You can provide a pillar which identifies the masters and agents of your cluster:

.. code:: yaml

  dcos:
    master_target: "my-dcos-master-*"
    master_targeting_method: 'glob'
    agent_target: "my-dcos-agent-*"
    agent_targeting_method: 'glob'


Now apply the ``dcos.service`` stat on these machines:

.. code:: yaml

  base:
    'my-dcos-(master|agent)-*':
      - match: pcre
      - dcos.service
