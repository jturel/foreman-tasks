class Setting::ForemanTasks < Setting
  def self.default_settings
    [
      set('foreman_tasks_sync_task_timeout', N_('Number of seconds to wait for synchronous task to finish.'), 120, N_('Sync task timeout')),
      set('dynflow_enable_console', N_('Enable the dynflow console (/foreman_tasks/dynflow) for debugging'), true, N_('Enable dynflow console')),
      set('dynflow_console_require_auth', N_('Require user to be authenticated as user with admin rights when accessing dynflow console'), true, N_('Require auth for dynflow console')),
      set('foreman_tasks_proxy_action_retry_count', N_('Number of attempts to start a task on the smart proxy before failing'), 4, N_('Proxy action retry count')),
      set('foreman_tasks_proxy_action_retry_interval', N_('Time in seconds between retries'), 15, N_('Proxy action retry interval')),
      set('foreman_tasks_proxy_batch_trigger', N_('Allow triggering tasks on the smart proxy in batches'), true, N_('Allow proxy batch tasks')),
      set('foreman_tasks_proxy_batch_size', N_('Number of tasks which should be sent to the smart proxy in one request, if foreman_tasks_proxy_batch_trigger is enabled'), 100, N_('Proxy tasks batch size')),
      set('foreman_tasks_troubleshooting_url',
          N_('Url pointing to the task troubleshooting documentation. '\
             'It should contain %{label} placeholder, that will be replaced with normalized task label '\
             '(restricted to only alphanumeric characters)). %{version} placeholder is also available.'),
          nil, N_('Tasks troubleshooting URL')),
      set('foreman_tasks_polling_multiplier',
          N_('Polling multiplier which is used to multiply the default polling intervals. '\
             'This can be used to prevent polling too frequently for long running tasks.'),
          1,
          N_("Polling intervals multiplier")),
    ]
  end

  def self.load_defaults
    Setting::BLANK_ATTRS.push('foreman_tasks_troubleshooting_url')
    Setting::NONZERO_ATTRS.push('foreman_tasks_polling_multiplier')
    super
  end
end
