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

package org::allbinary::logic::visual::transform::template::TransformTemplateFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::visual::transform::template::TransformTemplateFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::visual::transform::template::TransformTemplateFactory::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


# throws Exception
# Java overloaded method: Perl keeps the last definition
sub getInstance {
    my ($self, $abeClientInformation, $templateName, $propertiesHashMap, $pageContext) = @_;
        try {
            my $transformInfoEntity = 'org::allbinary::data::tables::transform::info::TransformInfoEntityBuilder'->getInstance();
            my $transformInfoInterface = $transformInfoEntity->get($templateName, $propertiesHashMap, $pageContext);
            return 'org::allbinary::logic::visual::transform::info::TransformInfoObjectFactory'->getInstance()->getInstance($abeClientInformation, $transformInfoInterface);
        } catch ($e) {
            my $error = "Failed To Get Instance";
            if ($org::allbinary::logic::visual::transform::template::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::template::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{TAGHELPERFACTORYERROR})) {
                $self->{logUtil}->put($error . $templateName . "->TemplateFactory", $self, "getInstance(viewName, HashMap, PageContext)", $e);
            }
            die $e;
        }
}

use java::util::HashMap;
# use javax::servlet::jsp::PageContext;
use org::allbinary::data::tables::transform::info::TransformInfoEntity;
use org::allbinary::data::tables::transform::info::TransformInfoEntityBuilder;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::system::security::licensing::AbeClientInformationInterface;
use org::allbinary::logic::visual::transform::info::TransformInfoInterface;
use org::allbinary::logic::visual::transform::info::TransformInfoObjectFactory;

1;

