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

package org::allbinary::logic::visual::transform::generator::TransformGeneratorUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::visual::transform::generator::TransformGeneratorUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::visual::transform::generator::TransformGeneratorUtil::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


# throws Exception
sub generate {
    my ($self, $abeClientInformation, $transformInfoInterface, $ownerTransformInfoInterface) = @_;
        try {
            if ($org::allbinary::logic::visual::transform::generator::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::generator::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                $self->{logUtil}->putF("Generating View: " . $transformInfoInterface->getName(), $self, "generate()");
            }
            my $componentInterface = 'org::allbinary::logic::visual::transform::TransformFactory'->getInstance()->getInstance($abeClientInformation, $transformInfoInterface->getName(), $ownerTransformInfoInterface);
            my $result = $componentInterface->view();
            my $httpTransformInfoInterface = $componentInterface->getTransformInfoInterface();
            my $inputOutputTypeData = 'org::allbinary::logic::io::InputOutputTypeData'->getInstance();
            if (index($result, "<HTML>") >= 0) {
                $httpTransformInfoInterface->getPropertiesHashMap()->put($inputOutputTypeData->{NAME}, $inputOutputTypeData->{DEFAULT});
            } else {
                $httpTransformInfoInterface->getPropertiesHashMap()->put($inputOutputTypeData->{NAME}, $inputOutputTypeData->{DEFAULT_FRAGMENT});
            }
            'org::allbinary::logic::visual::transform::info::objectConfig::generator::StoreFileGenerator'->new($componentInterface->getTransformInfoInterface())->process($result);
        } catch ($e) {
            if ($org::allbinary::logic::visual::transform::generator::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::generator::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
                $self->{logUtil}->put("Failed to generate a view", $self, "generate()", $e);
            }
            die $e;
        }
}


# throws Exception
# Java overloaded method: Perl keeps the last definition
sub generate {
    my ($self, $abeClientInformation, $transformInfoDomNode, $ownerTransformInfoInterface) = @_;
        $self->generate($abeClientInformation, $transformInfoDomNode->getTransformInfoInterface(), $ownerTransformInfoInterface);
}

use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::io::InputOutputTypeData;
use org::allbinary::logic::system::security::licensing::AbeClientInformationInterface;
use org::allbinary::logic::visual::transform::TransformFactory;
use org::allbinary::logic::visual::transform::TransformInterface;
use org::allbinary::logic::visual::transform::info::TransformInfoDomNode;
use org::allbinary::logic::visual::transform::info::TransformInfoHttpInterface;
use org::allbinary::logic::visual::transform::info::TransformInfoInterface;
use org::allbinary::logic::visual::transform::info::objectConfig::generator::StoreFileGenerator;

1;

