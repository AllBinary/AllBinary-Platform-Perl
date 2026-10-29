# Generated Code Do Not Modify

package org::allbinary::logic::visual::media::ImageIOUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


# throws Exception
sub read {
    my ($class, $file) = @_;
        return 'javax::imageio::ImageIO'->read('org::allbinary::logic::io::file::AbFileNativeUtil'->get($file));
}


# throws Exception
sub write {
    my ($class, $renderedImage, $name, $file) = @_;
        return 'javax::imageio::ImageIO'->write($renderedImage, $name, 'org::allbinary::logic::io::file::AbFileNativeUtil'->get($file));
}

# use java::awt::image::BufferedImage;
# use java::awt::image::RenderedImage;
# use javax::imageio::ImageIO;
use org::allbinary::logic::io::file::AbFile;
use org::allbinary::logic::io::file::AbFileNativeUtil;

1;

