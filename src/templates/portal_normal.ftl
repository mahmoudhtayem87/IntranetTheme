<!DOCTYPE html>

<#include init />

<html class="${root_css_class}" dir="<@liferay.language key=" lang.dir" />" lang="${w3c_language_id}">

<head>
    <title>${html_title}</title>
    <meta content="initial-scale=1.0, width=device-width" name="viewport" />

    <@liferay_util["include"] page=top_head_include />
     <link rel="stylesheet" href="${css_folder}/intranet/animate.css"/>
</head>

<body class="${css_class}">
 <@liferay_ui["quick-access"] contentId="#main-content" />

            <@liferay_util["include"] page=body_top_include />
    <@liferay.control_menu />

    <div class="d-flex flex-column min-vh-100">
        <div class="d-flex flex-column flex-fill" id="wrapper" style='direction:${languageUtil.get(locale, "lang.dir")}'>
           

            <section class="${portal_content_css_class} flex-fill" id="content">
                <h2 class="sr-only" role="heading" aria-level="1">${the_title}</h2>

                <#if selectable>
                    <@liferay_util["include"] page=content_include />
                    <#else>
                        ${portletDisplay.recycle()}

                        ${portletDisplay.setTitle(the_title)}

                        <@liferay_theme["wrap-portlet"] page="portlet.ftl">
                            <@liferay_util["include"] page=content_include />
                            </@>
                </#if>
            </section>
        </div>
    </div>

    <@liferay_util["include"] page=body_bottom_include />

    <@liferay_util["include"] page=bottom_include />
    
    <script src="${javascript_folder}/intranet/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- Custom scripts for all pages-->
    <script src="${javascript_folder}/intranet/js/sb-admin-2.js"></script>
    <script src="${javascript_folder}/intranet/js/canvasjs.min.js"></script>
    <script src="${javascript_folder}/intranet/js/familytree.js"></script>

<!-- Modal -->
<div class="modal fade" id="notificationsModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="notificationsModalTitle"></h4>
      </div>
      <div class="modal-body p-0">
        <iframe id="notificationsFrame" class="h-100 w-100" src="your url"></iframe>
      </div>
    </div>
  </div>
</div>
</body>

</html>