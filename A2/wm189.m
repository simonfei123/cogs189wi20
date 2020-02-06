function out = wm189(EEG_, window, points, channels)
    % Define a simple function which returns a 2D feature vector
    % INPUT:
    %   - EEG_:     EEG data structure (following EEGLAB format)
    %   - window:   2D array of [starting ending] points
    %   - points:   Number of points to extract from the window
    %   - channels: (optional) Cell array of channel labels, else use all
    %
    % OUTPUT:
    %   - 2D feature vector of dim observations x features
    %
    % Note: This function assumes the inputs are valid
    %       This function assumes points divide evenly
    %
    % Written by Alessandro "Ollie" D'Amico for COGS 189
    % https://github.com/cogs189wi20/cogs189wi20
    % Last Modified 5 February 2020
       
    % Find the index where the window starts and finishes
    % If the exact time is not found, use the closest time
    [~, w_s] = min(abs(window(1) - EEG_.times));
    [~, w_e] = min(abs(window(2) - EEG_.times));

    % Compute the step
    step = floor((w_e - w_s) / points);
    
    if nargin == 4
        % Convert channel names to indices
        ch_ = struct2cell(EEG_.chanlocs);
        ch_ = ch_(1, :);
        [~, ch] = intersect(ch_, channels); % 'argintersect'
    else
        ch = 1:EEG_.nbchan;
    end
    
    % Extract signals
    out = zeros(length(ch), points, EEG_.trials);
    for i = 1:EEG_.trials
        s_ = w_s;
        e_ = s_ + step;
        for j = 1:points
            out(:, j, i) = mean(EEG_.data(ch, s_:e_, i), 2);
            s_ = s_ + step;
            e_ = e_ + step;
        end
    end
    
    % Format out to be observations x features
    out = reshape(out, size(out, 1)*size(out, 2), size(out, 3))';
end