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

package org::allbinary::logic::visual::transform::info::objectConfig::generator::TransformInfoObjectConfigGeneratorFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::visual::transform::info::objectConfig::generator::TransformInfoObjectConfigGeneratorFactoryInterface';

our $instance = 'org::allbinary::logic::visual::transform::info::objectConfig::generator::TransformInfoObjectConfigGeneratorFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::visual::transform::info::objectConfig::generator::TransformInfoObjectConfigGeneratorFactory::instance;
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
    my ($self, $transformInfoInterface) = @_;
        my $type = $transformInfoInterface->getObjectConfigInterface()->getOutputTypeName();
        if ($org::allbinary::logic::visual::transform::info::objectConfig::generator::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::info::objectConfig::generator::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            $self->{logUtil}->putF("Generating Instance for type: " . $type, $self, $commonStrings->{GET_INSTANCE});
        }
        if (!defined($type) || ($type cmp 'org::allbinary::logic::io::InputOutputTypeData'->getInstance()->{RESPONSE}) == 0 || $transformInfoInterface->isChild()) {
            return 'org::allbinary::logic::visual::transform::info::objectConfig::generator::BasicGenerator'->new();
        } elsif (($type cmp 'org::allbinary::logic::io::InputOutputTypeData'->getInstance()->{FILE}) == 0) {
            return 'org::allbinary::logic::visual::transform::info::objectConfig::generator::StoreFileGenerator'->new($transformInfoInterface);
        } else {
            die ("No Such TransformInfoObjectConfigGenerator Type");
        }
}

use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::io::InputOutputTypeData;
use org::allbinary::logic::visual::transform::info::TransformInfoInterface;
use org::allbinary::string::CommonStrings;
use org::allbinary::logic::visual::transform::info::objectConfig::generator::TransformInfoObjectConfigGeneratorFactoryInterface;
use org::allbinary::logic::visual::transform::info::objectConfig::generator::StoreFileGenerator;
use org::allbinary::logic::visual::transform::info::objectConfig::generator::BasicGenerator;

1;

