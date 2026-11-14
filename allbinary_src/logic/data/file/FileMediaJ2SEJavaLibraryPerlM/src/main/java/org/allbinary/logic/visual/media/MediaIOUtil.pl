# Generated Code Do Not Modify

package org::allbinary::logic::visual::media::MediaIOUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object';

tie our $instance, 'java::lang::LazyStatic', sub { 'org::allbinary::logic::visual::media::MediaIOUtil'->new() };

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::visual::media::MediaIOUtil::instance;
}


sub getReaderFormatNames {
    my ($self) = @_;
        return 'javax::imageio::ImageIO'->getReaderFormatNames();
}


sub getWriterFormatNames {
    my ($self) = @_;
        return 'javax::imageio::ImageIO'->getWriterFormatNames();
}

use java::lang::Object ();
use java::lang::LazyStatic ();
# use javax::imageio::ImageIO ();

1;

