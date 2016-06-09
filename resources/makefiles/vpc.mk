vpc: plan_vpc
	cd $(BUILD); $(TF_APPLY)
	# Wait for vpc/subnets to be ready
	sleep 5

plan_vpc: init_vpc
	cd $(BUILD); $(TF_PLAN)

destroy_vpc:
	rm -f $(BUILD)/vpc*.tf; 
	cd $(BUILD); $(TF_APPLY)

init_vpc: init
	cp -rf $(RESOURCES)/terraforms/vpc*.tf $(BUILD)
	cd $(BUILD); $(TF_GET);

.PHONY: vpc destroy_vpc plan_vpc init_vpc

