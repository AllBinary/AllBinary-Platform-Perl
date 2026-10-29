# 
# AllBinary Open License Version 1 
# Copyright (c) 2025 AllBinary 
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

package org::allbinary::graphics::opengles::shader::NullShaderComposite;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::graphics::opengles::shader::ShaderComposite';

our $instance = do {
        package org::allbinary::graphics::opengles::shader::NullShaderComposite::AnonymousN65746 { our @ISA = ('org::allbinary::graphics::opengles::shader::NullShaderComposite');
        

        sub init {
            my ($self, $gl) = @_;
        }
        }
        'org::allbinary::graphics::opengles::shader::NullShaderComposite::AnonymousN65746'->can('new') ? 'org::allbinary::graphics::opengles::shader::NullShaderComposite::AnonymousN65746'->new('org::allbinary::graphics::opengles::OpenGLCapabilities'->getInstance()->{VERSION_2_0}, ['org::allbinary::graphics::opengles::shader::Shader'->new(), 'org::allbinary::graphics::opengles::shader::Shader'->new()], 'org::allbinary::graphics::opengles::shader::CompositeShaderUpdater'->getInstance(), 'org::allbinary::graphics::opengles::shader::ShaderInitializer'->getInstance(), 'org::allbinary::graphics::opengles::shader::ModelViewProjection'->getInstance(), undef, undef, 'org::allbinary::graphics::opengles::NullOpenGLProcessorFactory'->getInstance()) : bless({}, 'org::allbinary::graphics::opengles::shader::NullShaderComposite::AnonymousN65746')
    };


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::graphics::opengles::shader::NullShaderComposite::instance;
}


sub new {
    my ($class, $requiresOpenGLVersion, $shaderArray, $compositeShaderUpdater, $shaderInitializer, $modelViewProjection, $colorOpenGLProcessor, $vertexOpenGLProcessor, $disableProgramShaderOpenGLProcessor) = @_;
    my $self = $class->SUPER::new($requiresOpenGLVersion, $shaderArray, $compositeShaderUpdater, $shaderInitializer, $modelViewProjection, $colorOpenGLProcessor, $vertexOpenGLProcessor, $disableProgramShaderOpenGLProcessor);
        # super(...) made $self above
        $self->{useProgramShaderOpenGLProcessor} = 'org::allbinary::graphics::opengles::NullOpenGLProcessorFactory'->getInstance();
    return $self;
}

# use javax::microedition::khronos::opengles::GL10;
use org::allbinary::graphics::opengles::NullOpenGLProcessorFactory;
use org::allbinary::graphics::opengles::OpenGLCapabilities;
use org::allbinary::graphics::opengles::OpenGLProcessor;
use org::allbinary::graphics::opengles::shader::ShaderComposite;
use org::allbinary::graphics::opengles::shader::Shader;
use org::allbinary::graphics::opengles::shader::CompositeShaderUpdater;
use org::allbinary::graphics::opengles::shader::ShaderInitializer;
use org::allbinary::graphics::opengles::shader::ModelViewProjection;

1;

