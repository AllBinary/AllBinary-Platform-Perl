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

package org::allbinary::logic::visual::transform::generator::TransformsGeneratorUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::visual::transform::generator::TransformsGeneratorUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::visual::transform::generator::TransformsGeneratorUtil::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


# throws Exception
sub generateComponentsFromObjectConfig {
    my ($self, $abeClientInformation, $transformInfoInterface, $group) = @_;
        if ($org::allbinary::logic::visual::transform::generator::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::generator::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
            $self->{logUtil}->putF("Started Group: " . $group, $self, "generateComponentsFromObjectConfig(2)");
        }
        my $transformInfoObjectConfigInterface = $transformInfoInterface->getObjectConfigInterface();
        my $result = $self->generateComponentsFromObjectConfig($abeClientInformation, $transformInfoObjectConfigInterface, $transformInfoInterface, $group);
        if ($org::allbinary::logic::visual::transform::generator::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::generator::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
            $self->{logUtil}->putF("End Group: " . $group, $self, "generateComponentsFromObjectConfig(2)");
        }
        return $result;
}


# throws Exception
# Java overloaded method: Perl keeps the last definition
sub generateComponentsFromObjectConfig {
    my ($self, $abeClientInformation, $transformInfoObjectConfigInterface, $transformInfoInterface, $group) = @_;
        if ($org::allbinary::logic::visual::transform::generator::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::generator::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
            $self->{logUtil}->putF("Started Group: " . $group, $self, "generateComponentsFromObjectConfig()");
        }
        my $transformInfoObjectConfigComponentVector = $transformInfoObjectConfigInterface->getTransformsGroup($group);
        if ($org::allbinary::logic::visual::transform::generator::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::generator::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            $stringBuffer->append("Processing ");
            $stringBuffer->appendint($transformInfoObjectConfigComponentVector->size());
            $stringBuffer->append(" Components Group: ");
            $stringBuffer->append($group);
            $self->{logUtil}->putF($stringBuffer->toString(), $self, "generateComponentsFromObjectConfig()");
        }
        if ($transformInfoObjectConfigComponentVector->size() < 1) {
            die ("No Pages Generated For Template.");
        }
        my $size = $transformInfoObjectConfigComponentVector->size();
        for (my $index = 0; $index < $size; $index++) {
            my $transformInfoObjectConfigComponent = $transformInfoObjectConfigComponentVector->get($index);
            'org::allbinary::logic::visual::transform::generator::TransformGeneratorUtil'->getInstance()->generate($abeClientInformation, $transformInfoObjectConfigComponent, $transformInfoInterface);
        }
        if ($org::allbinary::logic::visual::transform::generator::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::generator::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
            $self->{logUtil}->putF("Done Group: " . $group, $self, "generateComponentsFromObjectConfig()");
        }
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append("<!-- Generated all template views successfully for View: ");
        $stringBuffer->append($transformInfoInterface->getName());
        $stringBuffer->append("-->");
        return $stringBuffer->toString();
}

use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::system::security::licensing::AbeClientInformationInterface;
use org::allbinary::logic::visual::transform::info::TransformInfoDomNode;
use org::allbinary::logic::visual::transform::info::TransformInfoInterface;
use org::allbinary::logic::visual::transform::info::objectConfig::TransformInfoObjectConfigInterface;
use org::allbinary::logic::visual::transform::generator::TransformGeneratorUtil;

1;

