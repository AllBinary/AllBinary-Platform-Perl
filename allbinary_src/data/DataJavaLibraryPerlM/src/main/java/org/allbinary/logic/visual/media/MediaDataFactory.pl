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

package org::allbinary::logic::visual::media::MediaDataFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::visual::media::MediaDataFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{AVI} = 'org::allbinary::logic::visual::media::MediaData'->new("avi");
    $self->{BMP} = 'org::allbinary::logic::visual::media::MediaData'->new("bmp");
    $self->{CEL} = 'org::allbinary::logic::visual::media::MediaData'->new("cel");
    $self->{FITS} = 'org::allbinary::logic::visual::media::MediaData'->new("fits");
    $self->{FLI} = 'org::allbinary::logic::visual::media::MediaData'->new("fli");
    $self->{GBR} = 'org::allbinary::logic::visual::media::MediaData'->new("gbr");
    $self->{GIF} = 'org::allbinary::logic::visual::media::MediaData'->new("gif");
    $self->{GIH} = 'org::allbinary::logic::visual::media::MediaData'->new("gih");
    $self->{JPG} = 'org::allbinary::logic::visual::media::MediaData'->new("jpg");
    $self->{PIX} = 'org::allbinary::logic::visual::media::MediaData'->new("pix");
    $self->{PNG} = 'org::allbinary::logic::visual::media::MediaData'->new("png");
    $self->{PNM} = 'org::allbinary::logic::visual::media::MediaData'->new("pnm");
    $self->{PSD} = 'org::allbinary::logic::visual::media::MediaData'->new("psd");
    $self->{PSP} = 'org::allbinary::logic::visual::media::MediaData'->new("psp");
    $self->{PS} = 'org::allbinary::logic::visual::media::MediaData'->new("ps");
    $self->{SGI} = 'org::allbinary::logic::visual::media::MediaData'->new("SGI");
    $self->{SWF} = 'org::allbinary::logic::visual::media::MediaData'->new("swf");
    $self->{TGA} = 'org::allbinary::logic::visual::media::MediaData'->new("tga");
    $self->{TIFF} = 'org::allbinary::logic::visual::media::MediaData'->new("tiff");
    $self->{WMF} = 'org::allbinary::logic::visual::media::MediaData'->new("wmf");
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::visual::media::MediaDataFactory::instance;
}

use org::allbinary::logic::visual::media::MediaData;

1;

