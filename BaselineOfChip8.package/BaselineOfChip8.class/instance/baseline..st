baseline
baseline: spec
    <baseline>
    spec
        for: #'common'
        do: [ 
            spec
                package: 'Chip8-Model';
		    package: 'Chip8-View';
		    package: 'Chip8-Presenter'.
            spec
                group: 'default' with: #('Chip8-Model' 'Chip8-View' 'Chip8-Presenter') ]