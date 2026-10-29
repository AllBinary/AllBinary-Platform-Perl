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

package org::allbinary::game::layer::resources::BasicGameResources;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{RESOURCE} = 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
    $self->{RESOURCE_DESTROY} = 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub init {
    my ($self, $ROOT, $SIZE) = @_;
        try {
            my $scale = int('org::allbinary::game::configuration::GameConfigurationCentral'->getInstance()->{SCALE}->getValue());
            if ($scale > 1 && $scale - 1 < scalar(@{$SIZE})) {
                $self->append($ROOT, $SIZE->[$scale - 1]);
            } else {
                die ('org::allbinary::logic::string::StringMaker'->new()->append("Invalid Value: ")->appendint($scale)->toString());
            }
        } catch ($e) {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            $self->{logUtil}->put($commonStrings->{EXCEPTION}, $self, $commonStrings->{INIT}, $e);
        }
}


# throws Exception
sub append {
    my ($self, $ROOT, $sizeString) = @_;
        my $DESTROY = "_destroy";
        my $string = $self->getString();
        $org::allbinary::game::layer::resources::BasicGameResources::stringBuffer->delete(0, $org::allbinary::game::layer::resources::BasicGameResources::stringBuffer->length());
        $org::allbinary::game::layer::resources::BasicGameResources::stringBuffer->append($ROOT);
        $org::allbinary::game::layer::resources::BasicGameResources::stringBuffer->append($string);
        $org::allbinary::game::layer::resources::BasicGameResources::stringBuffer->append($sizeString);
        $self->{RESOURCE} = $org::allbinary::game::layer::resources::BasicGameResources::stringBuffer->toString();
        $org::allbinary::game::layer::resources::BasicGameResources::stringBuffer->delete(0, $org::allbinary::game::layer::resources::BasicGameResources::stringBuffer->length());
        $org::allbinary::game::layer::resources::BasicGameResources::stringBuffer->append($ROOT);
        $org::allbinary::game::layer::resources::BasicGameResources::stringBuffer->append($DESTROY);
        $org::allbinary::game::layer::resources::BasicGameResources::stringBuffer->append($string);
        $org::allbinary::game::layer::resources::BasicGameResources::stringBuffer->append($sizeString);
        $self->{RESOURCE_DESTROY} = $org::allbinary::game::layer::resources::BasicGameResources::stringBuffer->toString();
}


# throws Exception
sub getString {
    my ($self) = @_;
        return 'org::allbinary::game::layer::resources::GameGraphicsResourceUtil'->getInstance()->getName();
}

use org::allbinary::game::configuration::GameConfigurationCentral;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::string::CommonStrings;
use org::allbinary::game::layer::resources::GameGraphicsResourceUtil;

1;

