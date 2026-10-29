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

package org::allbinary::logic::visual::transform::info::TransformInfoObjectFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::visual::transform::info::TransformInfoObjectFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::visual::transform::info::TransformInfoObjectFactory::instance;
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
    my ($self, $abeClientInformation, $transformInfoInterface) = @_;
        try {
            if ($org::allbinary::logic::visual::transform::info::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::info::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{TAGHELPERFACTORY})) {
                my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
                $self->{logUtil}->putF("Creating View: " . $transformInfoInterface->getName(), $self, $commonStrings->{GET_INSTANCE});
            }
            my $params = [(undef) x (1)];
            my $classes = [(undef) x (1)];
            $classes->[0] = 'org::allbinary::logic::visual::transform::info::TransformInfoInterface';
            $params->[0] = $transformInfoInterface;
            my $anyType = 'org::allbinary::logic::system::loader::AbeFactory'->getInstance()->getInstance($abeClientInformation, $transformInfoInterface->getObjectFile(), $classes, $params);
            if (!defined($anyType)) {
                if (defined($transformInfoInterface)) {
                    my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
                    $stringBuffer->append("\nNo Such View Name: ");
                    $stringBuffer->append($transformInfoInterface->getName());
                    $stringBuffer->append("\nNo Such View Object: ");
                    $stringBuffer->append($transformInfoInterface->getObjectFile());
                    die ($stringBuffer->toString());
                } else {
                    die ("No Such View Object since transformInfo is null");
                }
            }
            return $anyType;
        } catch ($e) {
            my $error = "Failed To Get Instance: ";
            if (defined($transformInfoInterface)) {
                $error = $error . $transformInfoInterface->getName();
            }
            if ($org::allbinary::logic::visual::transform::info::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::info::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{TAGHELPERFACTORYERROR})) {
                my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
                $self->{logUtil}->put($error, $self, $commonStrings->{GET_INSTANCE}, $e);
            }
            die $e;
        }
}

use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::system::loader::AbeFactory;
use org::allbinary::logic::system::security::licensing::AbeClientInformationInterface;
use org::allbinary::logic::system::security::licensing::LicensingException;
use org::allbinary::logic::visual::transform::TransformInterface;
use org::allbinary::string::CommonStrings;

1;

