#
# AllBinary Open License Version 1
# Copyright (c) 2011 AllBinary
# 
# By agreeing to this license you and any business entity you represent are
# legally bound to the AllBinary Open License Version 1 legal agreement.
# 
# You may obtain the AllBinary Open License Version 1 legal agreement from
# AllBinary or the root directory of AllBinary's AllBinary Platform repository.
# 
# Created By: Travis Berthelot
#  
# Generated Code Do Not Modify

package org::allbinary::logic::visual::transform::info::TransformInfoHttp;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::visual::transform::info::TransformInfo','org::allbinary::logic::visual::transform::info::TransformInfoHttpInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{abContext} = undef;
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new3(@arguments) if scalar(@arguments) == 3;
    return $class->_new3(@arguments) if scalar(@arguments) == 3;
    return $class->_new3(@arguments) if scalar(@arguments) == 3;
    return $class->_new2(@arguments) if scalar(@arguments) == 2;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    die "No constructor of TransformInfoHttp takes " . scalar(@arguments) . " arguments";
}


sub _new3 {
    my ($class, $propertiesHashMap, $pageContext, $crud) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        # super(...) made $self above
        $self->{abContext} = 'org::allbinary::business::context::AbContext'->new($propertiesHashMap, $pageContext);
        if ($org::allbinary::logic::visual::transform::info::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::info::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
            $self->{logUtil}->putF("Properties HashMap: " . $propertiesHashMap->toString(), $self, "Constructor(HashMap, PageContext, boolean)");
        }
        $self->override($propertiesHashMap);
    return $self;
}


sub _new3 {
    my ($class, $request, $propertiesHashMap, $pageContext) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        # super(...) made $self above
        $self->{abContext} = 'org::allbinary::business::context::AbContext'->new($propertiesHashMap, $pageContext);
        if ($org::allbinary::logic::visual::transform::info::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::info::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
            $self->{logUtil}->putF("Properties HashMap: " . $propertiesHashMap->toString(), $self, "Constructor(HttpServletRequest, HashMap, PageContext)");
        }
        $self->set('org::allbinary::logic::communication::http::request::RequestParams'->new($request)->toHashMap());
        $self->override($propertiesHashMap);
    return $self;
}


sub _new3 {
    my ($class, $databaseHashMap, $propertiesHashMap, $pageContext) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        # super(...) made $self above
        $self->{abContext} = 'org::allbinary::business::context::AbContext'->new($propertiesHashMap, $pageContext);
        if ($org::allbinary::logic::visual::transform::info::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::info::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
            $self->{logUtil}->putF("Properties HashMap: " . $propertiesHashMap->toString(), $self, "Constructor(HashMap, HashMap, PageContext)");
        }
        $self->set($databaseHashMap);
    return $self;
}


sub _new2 {
    my ($class, $propertiesHashMap, $pageContext) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        # super(...) made $self above
        $self->{abContext} = 'org::allbinary::business::context::AbContext'->new($propertiesHashMap, $pageContext);
        if ($org::allbinary::logic::visual::transform::info::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::info::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
            $self->{logUtil}->putF("Properties HashMap: " . $propertiesHashMap->toString(), $self, "Constructor(HashMap, PageContext)");
        }
        $self->set($propertiesHashMap);
    return $self;
}


sub _new1 {
    my ($class, $parentViewOfThisTransformInfoInterface) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        # super(...) made $self above
        $self->{abContext} = 'org::allbinary::business::context::AbContext'->new($parentViewOfThisTransformInfoInterface->getPropertiesHashMap(), $parentViewOfThisTransformInfoInterface->getPageContext());
    return $self;
}


# throws Exception
sub set {
    my ($self, $hashMap) = @_;
        if ($org::allbinary::logic::visual::transform::info::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::info::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
            $self->{logUtil}->putF("Properties HashMap: " . $hashMap->toString(), $self, "set()");
        }
        my $transformInfoData = 'org::allbinary::logic::visual::transform::info::TransformInfoData'->getInstance();
        $self->setName($hashMap->get($transformInfoData->{NAME}));
        $self->setStoreName($hashMap->get('org::allbinary::business::context::modules::storefront::StoreFrontData'->getInstance()->{NAME}));
        $self->setObjectFile($hashMap->get($transformInfoData->{OBJECTFILENAME}));
        $self->setObject($hashMap->get($transformInfoData->{OBJECT}));
        my $stringValidationUtil = 'org::allbinary::logic::string::StringValidationUtil'->getInstance();
        my $objectConfigString = $hashMap->get($transformInfoData->{OBJECTCONFIG});
        if ($stringValidationUtil->isValidRequired($objectConfigString, 10, $org::allbinary::logic::communication::sql::AbSqlData::MAXBLOB)) {
            $self->setObjectConfig($objectConfigString);
        } else {
            $self->setObjectConfig('org::allbinary::logic::visual::transform::info::objectConfig::TransformInfoObjectConfig'->new($self)->toString());
        }
        if (!$stringValidationUtil->isEmpty($hashMap->get($transformInfoData->{OBJECTCONFIGFILENAME}))) {
            $self->setObjectConfigFile($hashMap->get($transformInfoData->{OBJECTCONFIGFILENAME}));
        }
        $self->setTemplateFile($hashMap->get($transformInfoData->{TEMPLATEFILENAME}));
        $self->setTemplate($hashMap->get($transformInfoData->{TEMPLATE}));
        $self->setDataFile($hashMap->get($transformInfoData->{DATAFILENAME}));
        $self->setData($hashMap->get($transformInfoData->{DATA}));
        if ($org::allbinary::logic::visual::transform::info::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::info::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{TAGHELPERFACTORY})) {
            $self->{logUtil}->putF($self->log(), $self, "set()");
        }
}


sub getWeblisketSession {
    my ($self) = @_;
        return $self->{abContext}->getWeblisketSession();
}


sub getPageContext {
    my ($self) = @_;
        return $self->{abContext}->getPageContext();
}


sub getPropertiesHashMap {
    my ($self) = @_;
        return $self->{abContext}->getPropertiesHashMap();
}


# throws Exception
sub getTemplateFilePath {
    my ($self) = @_;
        return 'org::allbinary::logic::io::path::AbPath'->new('org::allbinary::globals::URLGLOBALS'->getMainPath() + 'org::allbinary::globals::FREEBLISKET_PATH_GLOBALS'->getInstance()->{XSLPATH}, $self->getTemplateFile());
}


# throws Exception
sub getObjectConfigFilePath {
    my ($self) = @_;
        return 'org::allbinary::logic::io::path::AbPath'->new('org::allbinary::globals::URLGLOBALS'->getMainPath() + 'org::allbinary::globals::FREEBLISKET_PATH_GLOBALS'->getInstance()->{XSLPATH}, $self->getObjectConfigFile());
}


# throws Exception
sub getDataFilePath {
    my ($self) = @_;
        return 'org::allbinary::logic::io::path::AbPath'->new('org::allbinary::globals::URLGLOBALS'->getMainPath() + 'org::allbinary::globals::FREEBLISKET_PATH_GLOBALS'->getInstance()->{XSLPATH}, $self->getDataFile());
}

use java::util::HashMap;
# use javax::servlet::http::HttpServletRequest;
# use javax::servlet::jsp::PageContext;
use org::allbinary::business::context::AbContext;
use org::allbinary::business::context::modules::storefront::StoreFrontData;
use org::allbinary::globals::FREEBLISKET_PATH_GLOBALS;
use org::allbinary::globals::URLGLOBALS;
use org::allbinary::logic::communication::http::request::RequestParams;
use org::allbinary::logic::communication::http::request::session::WeblisketSessionInterface;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::communication::sql::AbSqlData;
use org::allbinary::logic::io::path::AbPath;
use org::allbinary::logic::string::StringValidationUtil;
use org::allbinary::logic::visual::transform::info::objectConfig::TransformInfoObjectConfig;
use org::allbinary::logic::visual::transform::info::TransformInfo;
use org::allbinary::logic::visual::transform::info::TransformInfoHttpInterface;
use org::allbinary::logic::visual::transform::info::TransformInfoData;

1;

