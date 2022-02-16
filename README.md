[![shellcheck](https://github.com/UCSF-CBI/c4-ondemand-interactive-apps/actions/workflows/shellcheck.yml/badge.svg)](https://github.com/UCSF-CBI/c4-ondemand-interactive-apps/actions/workflows/shellcheck.yml)

# c4-ondemand-interactive-apps

## Interactive Applications for OnDemand on the C4 cluster

* RStudio - A containerless approach to Rstudio Server. Requires CBI modules.
* jupyter - A basic Jupyter Notebook. No container. Used a virtual env and installed in a shared FS.
* bc_desktop - This is core OnDemand code. Opens a MATE desktop to a comput node with standards Slurm allocations.

## Deployment instructions from c4-ondemand[1-2]

### bc_desktop

Since this is a core OOD application, it is treated differently from the rest.

1. Log in as ansible.
2. `cd repositories`
3. `git pull origin main`
4. `cd ~/repositories/c4-ondemand-interactive-apps/bc_desktop/etc/ood/config/apps`
5. `sudo cp -Rf bc_desktop/ /etc/ood/config/apps/`

### RStudio Server

1. Log in as ansible.
2. `cd repositories`
3. `git pull origin main`
4. `cd ~/repositories/c4-ondemand-interactive-apps`
5. `sudo  cp -Rf RStudio/ /var/www/ood/apps/sys/`

### Jupyter Notebook

1. Log in as ansible.
2. `cd repositories`
3. `git pull origin main`
4. `cd ~/repositories/c4-ondemand-interactive-apps`
5. `sudo  cp -Rf jupyter/ /var/www/ood/apps/sys/`
6. 
