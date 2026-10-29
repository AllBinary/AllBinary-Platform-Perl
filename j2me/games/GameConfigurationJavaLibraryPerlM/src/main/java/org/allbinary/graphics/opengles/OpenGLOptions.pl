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

package org::allbinary::graphics::opengles::OpenGLOptions;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub init {
    my ($self) = @_;
        my $openGLFeatureFactory = 'org::allbinary::graphics::opengles::OpenGLFeatureFactory'->getInstance();
        if ('org::allbinary::game::configuration::feature::Features'->getInstance()->isFeature($openGLFeatureFactory->{OPENGL_OPTIONS})) {
            my $openGLMultipleList = 'org::allbinary::util::BasicArrayListD'->new();
            $openGLMultipleList->add($openGLFeatureFactory->{OPENGL});
            'org::allbinary::game::configuration::feature::GameFeatureChoiceGroups'->getMultipleInstance()->add("OpenGL (Complete Restart)", $openGLMultipleList);
            my $openGLVersionSelectorMultipleList = 'org::allbinary::util::BasicArrayListD'->new();
            $openGLVersionSelectorMultipleList->add($openGLFeatureFactory->{OPENGL_AUTO_SELECT});
            $openGLVersionSelectorMultipleList->add($openGLFeatureFactory->{OPENGL_MINIMUM});
            'org::allbinary::game::configuration::feature::GameFeatureChoiceGroups'->getExclusiveInstance()->add("OpenGL Version Selector", $openGLVersionSelectorMultipleList);
            my $openGLImageColorMultipleList = 'org::allbinary::util::BasicArrayListD'->new();
            $openGLImageColorMultipleList->add($openGLFeatureFactory->{IMAGE_COLOR_DEPTH_4444});
            $openGLImageColorMultipleList->add($openGLFeatureFactory->{IMAGE_COLOR_DEPTH_8888});
            'org::allbinary::game::configuration::feature::GameFeatureChoiceGroups'->getExclusiveInstance()->add("OpenGL Image Color RGBA", $openGLImageColorMultipleList);
        }
}

use org::allbinary::game::configuration::feature::Features;
use org::allbinary::game::configuration::feature::GameFeatureChoiceGroups;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::graphics::opengles::OpenGLFeatureFactory;

1;

