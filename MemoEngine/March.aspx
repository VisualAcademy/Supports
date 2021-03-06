﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard/DashboardCore.Master" AutoEventWireup="true" CodeBehind="March.aspx.cs" Inherits="MemoEngine.March" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeaderContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Breadcrumb-->
    <ol class="breadcrumb">
        <li class="breadcrumb-item">Home</li>
        <li class="breadcrumb-item">
            <a href="#">Admin</a>
        </li>
        <li class="breadcrumb-item active">March</li>
        <!-- Breadcrumb Menu-->
        <li class="breadcrumb-menu d-md-down-none">
            <div class="btn-group" role="group" aria-label="Button group">
                <a class="btn" href="#">
                    <i class="icon-speech"></i>
                </a>
                <a class="btn" href="./">
                    <i class="icon-graph"></i>Dashboard</a>
                <a class="btn" href="#">
                    <i class="icon-settings"></i>Settings</a>
            </div>
        </li>
    </ol>

    <div class="container-fluid">
        <div class="animated fadeIn">

            <div class="card">
                <div class="card-header">
                    March
                </div>
                <div class="card-body">
                    <input type="text" id="Id" name="Id" 
                        value="<%= string.IsNullOrEmpty(this.Request.QueryString["Id"]) ? "-1" : this.Request.QueryString["Id"] %>" />
                </div>
            </div>

            <div>
                <div class="col-12 text-center mb-4">
                    <button id="btnPrev" class="btn btn-secondary">&lt; 이전</button>
                    <button id="btnSave" class="btn btn-primary">저장</button>
                    <button id="btnNext" class="btn btn-secondary" disabled>다음 &gt;</button>
                </div>
            </div>

        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FooterContent" runat="server">
    <script>
        /******************************************************
         * 전역 변수
         ******************************************************/

        var orgPageInfo = null; // 변경 전 최초 페이지 데이터 
               
        $(function () {
            // 변경 전 최초 페이지 데이터 
            orgPageInfo = $("#form1").serialize();
        });

        /******************************************************
         * 이벤트 핸들러 설정 - 이전/저장/다음
         ******************************************************/

        // 이전 버튼에 대한 Click 이벤트 핸들러 설정
        $("#btnPrev").click(function () {
            var id = parseInt($("#Id").val(), 10);
            if (id > -1) {
                self.location.href = "February.aspx?Id=" + id;
            }
            return false; 
        });
        // 저장 버튼에 대한 Click 이벤트 핸들러 설정
        $("#btnSave").click(function (e, from) {
            var id = parseInt($("#Id").val(), 10);
            if (from == "NEXT") {
                self.location.href = "April.aspx?Id=" + id;
            }
            else {
                self.location.href = "March.aspx?Id=" + id;
            }

            return false; // ASP.NET 기본 템플릿에서 SEO 사용
        });
        // 다음 버튼에 대한 Click 이벤트 핸들러 설정
        $("#btnNext").click(function () {
            var id = parseInt($("#Id").val(), 10);

            // 변경 전 최초 페이지 데이터 비교
            if (orgPageInfo == $("#form1").serialize()) {
                // 변경 안 됨
                self.location.href = "April.aspx?Id=" + id;
            }
            else {
                // 변경됨
                $("#btnSave").trigger("click", ["NEXT"]);
            }
            
            return false; // ASP.NET 기본 템플릿에서 SEO 사용
        });

    </script>
</asp:Content>
