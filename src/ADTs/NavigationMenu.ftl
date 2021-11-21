<style>
		.upperCase
		{
    	text-transform: capitalize;
		}
</style>

<div class="flex-container mx-4" style="justify-content: start;">
  <#if entries?has_content>
	<#list entries as navigationEntry>
	 <#if !navigationEntry.hasChildren()>
	
		<div class="m-2 card border-bottom-primary  h-100 py-2 shadow-lg animate__animated " style="flex-basis:calc(100% / 6)">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                                
																									<a href="${navigationEntry.getURL()}">	${navigationEntry.getName()}</a>
																							
																					</div>
                                           
                                        </div>
                                        <div class="col-auto">
                                            <i class="fa fa-link fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
		</#if>
	</#list>
</#if>
</div>
<div class="flex-container mx-4">
  <#if entries?has_content>
	<#list entries as navigationEntry>
	 <#if navigationEntry.hasChildren()>
		<#assign uniqueId = .now?string["HHmmssSSS"]?number />
<div class="card m-2 shadow-lg animate__animated" style="flex-basis:calc(100% / 6)">
                                <!-- Card Header - Accordion -->
                                <a href="#card_${uniqueId}" class="d-block card-header py-3" data-toggle="collapse"
                                    role="button" aria-expanded="true" aria-controls="card_${uniqueId}">
                                    <h6 class="m-0 font-weight-bold text-primary">
																		${navigationEntry.getName()}
																		</h6>
                                </a>
                                <!-- Card Content - Collapse -->
                                <div class="collapse " id="card_${uniqueId}">
                                    <div class="card-body">
                                       <#list navigationEntry.getChildren() as SubEntry>
                                    <#assign subActive="" />
                                    <#if SubEntry.isSelected()>
                                        <#assign subActive="active">
                                    </#if>
                                    <a class=" d-flex ${subActive} upperCase text_shadow"
                                        href="${SubEntry.getURL()}">${SubEntry.getName()}</a>
                                </#list>
                                    </div>
                                </div>
                            </div>
		</#if>
	</#list>
</#if>
</div>