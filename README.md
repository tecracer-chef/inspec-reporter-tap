# inspec-reporter-tap Plugin

InSpec TAP (Test Anything Protocol) reporter.

## To Install This Plugin

Inside InSpec:

```shell
you@machine $ inspec plugin install inspec-reporter-tap
```

For use within `kitchen`:

```shell
you@machine $ gem install inspec-reporter-tap
```

## How to use this plugin

To generate a TAP13 report using this plugin and save the output to a file named `report.tap`, run:

```shell
you@machine $ inspec exec some_profile --reporter tap13:/tmp/report.tap
```

If you prefer the older format, you can generate this as well:

```shell
you@machine $ inspec exec some_profile --reporter tap:/tmp/report.tap
```

Note that `tap` and `tap13` are the reporter names.

## Configuring the Plugin

The `tap`/`tap13` reporters requires no configuration to function.

## Example output: TAP13

This is a shortened result from running the devsec.io linux-baseline:

```
TAP version 13
1..112
ok 1 Trusted hosts login
ok 2 Check owner and permissions for /etc/shadow
ok 3 Check owner and permissions for /etc/shadow

# ... other lines omitted ...

not ok 108 Magic SysRq
 ---
 message: kernel_parameter value is expected to eq 0
 severity: critical
 ---
ok 109 Secure Core Dumps - dump settings
ok 110 Secure Core Dumps - dump path
ok 111 kernel.randomize_va_space
ok 112 CPU No execution Flag or Kernel ExecShield
FAILED tests 35, 36, 37, 49, 50, 51, 52, 53, 54, 55, 66, 69, 70, 75, 76, 77, 78, 79, 80, 85, 88, 89, 90, 91, 92, 93, 94, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 108
Failed 39/112, 65.18% okay
```

## Example output: TAP

This is a shortened result from running the devsec.io linux-baseline:

```
1..112
ok 1 Trusted hosts login
ok 2 Check owner and permissions for /etc/shadow
ok 3 Check owner and permissions for /etc/shadow

# ... other lines omitted ...

not ok 108 Magic SysRq
# message: kernel_parameter value is expected to eq 0
# severity: critical
ok 109 Secure Core Dumps - dump settings
ok 110 Secure Core Dumps - dump path
ok 111 kernel.randomize_va_space
ok 112 CPU No execution Flag or Kernel ExecShield
```

## Developing This Plugin

Submit PR and will discuss, thank you!
