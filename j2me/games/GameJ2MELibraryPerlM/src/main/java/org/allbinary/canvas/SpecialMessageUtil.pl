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

package org::allbinary::canvas::SpecialMessageUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $SINGLETON = 'org::allbinary::canvas::SpecialMessageUtil'->new();

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::canvas::SpecialMessageUtil::SINGLETON;
}


sub get {
    my ($self) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append('org::allbinary::system::Memory'->getInfo());
        $stringBuffer->append('org::allbinary::string::CommonSeps'->getInstance()->{SPACE});
        $stringBuffer->append('org::allbinary::canvas::GameStatisticsFactory'->getInstance()->toString());
        $stringBuffer->append('org::allbinary::string::CommonSeps'->getInstance()->{SPACE});
        $stringBuffer->append(" Option: ");
        if ('org::allbinary::game::configuration::feature::Features'->getInstance()->isDefault('org::allbinary::graphics::opengles::OpenGLFeatureFactory'->getInstance()->{OPENGL_AUTO_SELECT})) {
            $stringBuffer->append('org::allbinary::graphics::opengles::OpenGLFeatureFactory'->getInstance()->{OPENGL_AUTO_SELECT}->getName());
        } else {
            $stringBuffer->append('org::allbinary::graphics::opengles::OpenGLFeatureFactory'->getInstance()->{OPENGL_MINIMUM}->getName());
        }
        return $stringBuffer->toString();
}

use org::allbinary::game::configuration::feature::Features;
use org::allbinary::graphics::opengles::OpenGLFeatureFactory;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::string::CommonSeps;
use org::allbinary::system::Memory;
use org::allbinary::canvas::GameStatisticsFactory;

1;

