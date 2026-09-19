package terraform_governance

deny contains msg if {
    resource := input.resource_changes[_]

    resource.change.after.tags == null

    msg := sprintf(
        "Resource %s must define mandatory tags",
        [resource.address]
    )
}