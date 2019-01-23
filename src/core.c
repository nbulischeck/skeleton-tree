#include "core.h"

static int init_mod(void){
	printk("module: init success\n");
	return 0;
}

static void exit_mod(void){
}

module_init(init_mod);
module_exit(exit_mod);

MODULE_LICENSE("GPL");
