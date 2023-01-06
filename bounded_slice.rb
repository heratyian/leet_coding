def solution(k, a)
    bounded_slice_count = 0

    a.each_with_index do |p_item, p_index|
        for q_index in p_index..a.length - 1 do
            q_item = a[q_index]
            max = a[p_index..q_index].max
            min = a[p_index..q_index].min
            diff = max - min
        if (diff <= k)
            puts "(#{p_index}, #{q_index})"
            bounded_slice_count += 1
        else
            break
        end
        end
    end

    bounded_slice_count > 1000000000 ? 1000000000 : bounded_slice_count
end

solution(2, [3, 5, 7, 6, 3])

