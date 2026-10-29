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

package org::allbinary::graphics::canvas::transition::progress::ProgressCanvasFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $PROGRESS_FORM_SCREEN = 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT};

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        if ($org::allbinary::graphics::canvas::transition::progress::ProgressCanvasFactory::PROGRESS_FORM_SCREEN == 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT}) {
            $org::allbinary::graphics::canvas::transition::progress::ProgressCanvasFactory::PROGRESS_FORM_SCREEN = 'org::allbinary::graphics::canvas::transition::progress::AndroidBasicTitleProgressBar'->new('org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, 'org::allbinary::graphics::color::BasicColorFactory'->getInstance()->{BLACK}, 'org::allbinary::graphics::color::BasicColorFactory'->getInstance()->{WHITE});
        }
        return $org::allbinary::graphics::canvas::transition::progress::ProgressCanvasFactory::PROGRESS_FORM_SCREEN;
}


sub getLazyInstance {
    my ($class) = @_;
        return 'org::allbinary::graphics::paint::NullPaintable'->getInstance();
}

use org::allbinary::graphics::color::BasicColorFactory;
use org::allbinary::graphics::paint::NullPaintable;
use org::allbinary::graphics::paint::PaintableInterface;
use org::allbinary::logic::NullUtil;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::graphics::canvas::transition::progress::AndroidBasicTitleProgressBar;

1;

