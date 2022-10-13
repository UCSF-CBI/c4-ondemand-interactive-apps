[![shellcheck](https://github.com/UCSF-CBI/c4-ondemand-interactive-apps/actions/workflows/shellcheck.yml/badge.svg)](https://github.com/UCSF-CBI/c4-ondemand-interactive-apps/actions/workflows/shellcheck.yml)
[![yamllint](https://github.com/UCSF-CBI/c4-ondemand-interactive-apps/actions/workflows/yamllint.yml/badge.svg)](https://github.com/UCSF-CBI/c4-ondemand-interactive-apps/actions/workflows/yamllint.yml)

# Interactive Applications for OnDemand on the UCSF C4 Cluster

This repository holds the configuration for the UCSF C4 OnDemand services. Open [OnDemand](https://openondemand.org/) provides access to high-performance-compute (HPC) resources via the web browser, e.g. a file management, a command-line shell, a graphical desktop environment, job scheduler management, and access popular graphical user interfaces (GUIs).  The C4 OnDemand service, currently provides:

* bc_desktop - A [MATE Desktop](https://mate-desktop.org/) environment
* RStudio Server - Depends on the [CBI software](https://github.com/HenrikBengtsson/CBI-software) stack.
* Jupyter Notebook - Depends on a virtual environmeent that is installed on a shared file system.

These services are launched automatically via the [C4 job scheduler](https://www.c4.ucsf.edu/about/specs.html) and will run on a compute node that can meet the requests resource specifications.


## Deployment instructions from c4-ondemand[1-2]

### bc_desktop

Since this is a core Open OnDemand application, it is treated differently from the rest.

1. Log in as `ansible`
2. `cd repositories`
3. `git pull origin main`
4. `cd ~/repositories/c4-ondemand-interactive-apps/bc_desktop/etc/ood/config/apps`
5. `sudo cp -Rf bc_desktop/ /etc/ood/config/apps/`


### RStudio Server

1. Log in as `ansible`
2. `cd repositories`
3. `git pull origin main`
4. `cd ~/repositories/c4-ondemand-interactive-apps`
5. `sudo  cp -Rf RStudio/ /var/www/ood/apps/sys/`


### Jupyter Notebook

1. Log in as `ansible`
2. `cd repositories`
3. `git pull origin main`
4. `cd ~/repositories/c4-ondemand-interactive-apps`
5. `sudo  cp -Rf jupyter/ /var/www/ood/apps/sys/`


## Resources

* Open OnDemand:
  - Website: https://openondemand.org/
  - Documentation: https://osc.github.io/ood-documentation/latest/
  - Source code: https://github.com/OSC/ondemand/
