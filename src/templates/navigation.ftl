<!-- Sidebar -->
<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion toggled" id="accordionSidebar">
    <!-- Sidebar - Brand -->
    <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
        <div class="sidebar-brand-icon">
            <img src="${themeDisplay.getCompanyLogo()}" style="max-width:48px" />
        </div>
        <div class="sidebar-brand-text mx-3">${company.getName()}</div>
    </a>
    <!-- Divider -->
    <hr class="sidebar-divider my-0">
    <#if has_navigation && is_setup_complete>
		<@liferay.navigation_menu default_preferences="${preferences}" />
    </#if>
</ul>
<!-- End of Sidebar -->